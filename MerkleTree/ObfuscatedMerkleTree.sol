pragma solidity 0.8.20;contract Tree { bytes32[] public hashes; string[4] transactions = [ "TX1: Sherlock -> John", "TX2: John -> Sherock", "TX3: John -> Mary", "TX4: Mary -> Sherlock" ]; constructor() { for(uint i = 0; i < transactions.length; i++) { hashes.push(makeHash(transactions[i])); } uint count = transactions.length; uint offset = 0; while(count > 0) { for(uint i = 0; i < count - 1; i += 2) { hashes.push(keccak256( abi.encodePacked( hashes[offset + i], hashes[offset + i + 1] ) )); } offset += count; count = count / 2; } } function verify(string memory transaction, uint Ox58b9ffd3b42b5c500d8d197f6b8f675eed42288c, bytes32 root, bytes32[] memory proof) public pure returns(bool) { bytes32 Oxfe00a877f0df7a3986302d72b6eb85403783ef67 = makeHash(transaction); for(uint i = 0; i < proof.length; i++) { bytes32 element = proof[i]; if (Ox58b9ffd3b42b5c500d8d197f6b8f675eed42288c % 2 == 0) { Oxfe00a877f0df7a3986302d72b6eb85403783ef67 = keccak256(abi.encodePacked(Oxfe00a877f0df7a3986302d72b6eb85403783ef67, element)); } else { Oxfe00a877f0df7a3986302d72b6eb85403783ef67 = keccak256(abi.encodePacked(element, Oxfe00a877f0df7a3986302d72b6eb85403783ef67)); } Ox58b9ffd3b42b5c500d8d197f6b8f675eed42288c = Ox58b9ffd3b42b5c500d8d197f6b8f675eed42288c / 2; } return Oxfe00a877f0df7a3986302d72b6eb85403783ef67 == root; } function makeHash(string memory input) public pure returns(bytes32) { return keccak256( abi.encodePacked(input) ); }}