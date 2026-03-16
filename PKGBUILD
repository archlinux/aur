# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=oxfmt-bin
pkgver=0.41.0
pkgrel=1
pkgdesc="Oxfmt is a high-performance formatter for the JavaScript ecosystem"
arch=('x86_64' 'aarch64')
url="https://oxc.rs"
license=('MIT')
provides=('oxfmt')
conflicts=('oxfmt')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v1.56.0"
_binary_x86_64="oxfmt-x86_64-unknown-linux-gnu"
_binary_aarch64="oxfmt-aarch64-unknown-linux-gnu"

source_x86_64=("${_binary_x86_64}-$pkgver.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}-$pkgver.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('0be43b854dab8768b7f81fa742d0f289a18b44f0ee99c93090b4599c7f79325b')
sha256sums_aarch64=('e8c647592503d8235c150530f1e432b359b3ca8ba015a72877da1d61de3f3625')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
