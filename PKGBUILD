# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=sui
_env=mainnet
pkgname=${_pkgname}-${_env}-bin
pkgver=1.61.2
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("$_pkgname")
provides=("$_pkgname")

source_x86_64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-aarch64.tgz")

sha256sums_x86_64=('c9ba0c06da1b31c266c37feada585330b9a3ecbbb2026db9746a158f9b6a3f3b')
sha256sums_aarch64=('353548c4331d7d4d9d33fbd75dfa170ada07f0a9db65693ddf6899eb4f4bfc45')

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
