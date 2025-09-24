# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=sui
_env=testnet
pkgname=${_pkgname}-${_env}-bin
pkgver=1.57.0
pkgrel=1
pkgdesc="Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language"
arch=("x86_64" "aarch64")
url="https://github.com/MystenLabs/sui"
license=("Apache-2.0")
conflicts=("$_pkgname")
provides=("$_pkgname")

source_x86_64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-x86_64.tgz")
source_aarch64=("$url/releases/download/${_env}-v${pkgver}/${_pkgname}-${_env}-v${pkgver}-ubuntu-aarch64.tgz")

sha256sums_x86_64=('19493d1e6986a3b1ba0f4923e515520d8a3071bf6784ce42fae2a9ecbde4f5d5')
sha256sums_aarch64=('2b58de9e9cf7edc845c96fe062c60bfbee4f7ef003d88c35344e54d2ea8ae27c')

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
