# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=sui
_env=mainnet
pkgname=${_pkgname}-${_env}-bin
pkgver=1.58.3
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("$_pkgname")
provides=("$_pkgname")

source_x86_64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-aarch64.tgz")

sha256sums_x86_64=('1737b155a69a07c4aa8337333f18b388569fdb1548e4ebdcfa2b8b75c93400f0')
sha256sums_aarch64=('74c5727ce8382ca543dede6cf0e66adac0e7fd5855b0ac8289ce52896f6f315a')

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
