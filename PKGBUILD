# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-mainnet-bin
pkgver=1.53.2
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-testnet-bin")
provides=("sui")

source_x86_64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('e93ca7e2c884c3292e47788373b38e519b5eb486766d785963e2c63dfee86357')
sha256sums_aarch64=('03893d3cd234cd40ddd7228aa6066f82617d23c1be8e9bf591028534b7f01a41')

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
