# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-testnet-bin
pkgver=1.50.1
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-mainnet-bin")
provides=("sui")

source_x86_64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('48ca5c22a50b095bdd493a6b43c3c8fccffe9c27ec946b05ce8aba599c258ea9')
sha256sums_aarch64=('ffb288ba2a71a16c4768ced8a29450a033c1f4dd63a3c68100defe615e0ab058')

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
