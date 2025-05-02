# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-testnet-bin
pkgver=1.48.0
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-mainnet-bin")

source_x86_64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('44734e797add8d6bee531b9e9778ec8431db43e3938ebe4aa03b14c0638b903f')
sha256sums_aarch64=('5b47b03cddeeea5f00784ad8de6cd4111737b56678f67031e1f6aeb48a75dfe2')

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
