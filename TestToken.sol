pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
contract TestToken is ERC20{
    address public admin;
    constructor(uint supply) ERC20("TestToken","TUS") {
        admin=msg.sender;
        _mint(msg.sender,supply);
    }
    function mint(address to, uint amount) external{
        require(msg.sender==admin,"Admin Access Only");
        _mint(to,amount);
    }
    function burn(uint amount) external{
        _burn(msg.sender,amount);
    }
    function burnFrom(address from, uint amount) external{
        require(msg.sender==admin,"Admin Access Only");
        _burn(from,amount);
    }
}
