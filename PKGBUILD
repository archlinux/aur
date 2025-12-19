# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=sui
_env=mainnet
pkgname=${_pkgname}-${_env}-bin
pkgver=1.62.1
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("$_pkgname")
provides=("$_pkgname")

source_x86_64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-aarch64.tgz")

sha256sums_x86_64=('f0f1d4e1e733cba5a4c95e01b5c1cbcba3c445b73beda976c70e243755b9361a')
sha256sums_aarch64=('85213edb4f3c7441b99b75f97596f8593a2ea48ad395771a53a71a27fde82026')

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
