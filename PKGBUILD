# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-testnet-bin
pkgver=1.49.1
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-mainnet-bin")
provides=("sui")

source_x86_64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('85186d4850420fbdc31708de0325dd72de9af1dbd9aea1db296728b125440400')
sha256sums_aarch64=('36887eb904922b9e04b2e0be12365cdb332dfd533393815b71cd64341255d203')

package() {
    binaries=(
        move-analyzer
        sui
        sui-bridge
        sui-bridge-cli
        sui-data-ingestion
        sui-debug
        sui-faucet
        sui-graphql-rpc
        sui-node
        sui-test-validator
        sui-tool
    )
    for bin in "${binaries[@]}"; do
        install -Dm0755 -t "${pkgdir}/usr/bin/" "$bin"
    done
}
