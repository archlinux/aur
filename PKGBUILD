# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-mainnet-bin
pkgver=1.49.2
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-testnet-bin")
provides=("sui")

source_x86_64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('56ba1793d1988ce5dc0aea0f6489a9861be18659e68fdbce46d681da04760f02')
sha256sums_aarch64=('59ff94faab1b63e9578d0af398e16ec73df99dfd094cfbd84ea2c45bebe93ccf')

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
