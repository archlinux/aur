# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-testnet-bin
pkgver=1.49.2
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-mainnet-bin")
provides=("sui")

source_x86_64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('0b4a0d8c6cd6e2b3705ea8ff719eac872bb06619b5be97bb2f4c8fdcdb45e24f')
sha256sums_aarch64=('f80fa19f941e5cd38fca4e90e6be8241a7856e00d22f4a8f89cb897d0d39a242')

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
