# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=sui-mainnet-bin
pkgver=1.51.4
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("sui" "sui-testnet-bin")
provides=("sui")

source_x86_64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/mainnet-v$pkgver/sui-mainnet-v$pkgver-ubuntu-aarch64.tgz")

sha256sums_x86_64=('c780e3bc5a218c9f512773af57219689037dae19400015a35ca85c86a0d42031')
sha256sums_aarch64=('2b3eee123ba60b53910ea18aacce825a5e27ee3b6aaca17e898627d24ed43a81')

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
