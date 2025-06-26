# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-mainnet-bin
pkgver=1.50.1
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-testnet-bin")
provides=("sui")

source_x86_64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('38924512e1c6185c55baf8d573fd03753aae28e97edcd1fdfce7ab68ebd5e06c')
sha256sums_aarch64=('ba1d3e5a500c8031dbda7e6a11312d5ee1d001d100690304916268c50d6e29ad')

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
