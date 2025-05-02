# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-mainnet-bin
pkgver=1.47.1
pkgrel=2
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-testnet-bin")

source_x86_64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('82747bdcaa68eb6123f389cf5b70832c17498831f1f5921c3b5da7e36999a320')
sha256sums_aarch64=('bd27250bf63d1ce45f6a0b2fd3eac46dce4c82dfa496140efd0518ea11bca320')

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
