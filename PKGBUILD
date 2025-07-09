# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-testnet-bin
pkgver=1.51.3
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-mainnet-bin")
provides=("sui")

source_x86_64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/testnet-v$pkgver/sui-testnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('98abd9d97636fc9cc5c2fe96e335ca85c2e014bbb4174c6246b96e30c2e5f8bd')
sha256sums_aarch64=('1a762adc0d98b1d8955608ed6b2d6a881c9d54a65edb762e2955d85bb626a101')

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
