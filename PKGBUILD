# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=sui
_env=testnet
pkgname=${_pkgname}-${_env}-bin
pkgver=1.63.2
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("$_pkgname")
provides=("$_pkgname")

source_x86_64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-aarch64.tgz")

sha256sums_x86_64=('133da803c408c5e50c33189442f6bc69a2d3c167b95abfccef29bb95f2cff800')
sha256sums_aarch64=('27bff6d64f6bc054919ded1f0ae1907c6912454595f3b1a8742aa78802b3acdf')

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
