# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=oxfmt-bin
pkgver=0.43.0
oxlint_pkgver=1.58.0
pkgrel=1
pkgdesc="Oxfmt is a high-performance formatter for the JavaScript ecosystem"
arch=('x86_64' 'aarch64')
url='https://oxc.rs'
license=('MIT')
provides=('oxfmt')
conflicts=('oxfmt')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v$oxlint_pkgver"
_binary_x86_64="oxfmt-x86_64-unknown-linux-gnu"
_binary_aarch64="oxfmt-aarch64-unknown-linux-gnu"

source_x86_64=("${_binary_x86_64}-$pkgver.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}-$pkgver.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('1f27de498351d4ff154dcf06a427d75669bd07ebbaced62159859b5ce012ec32')
sha256sums_aarch64=('99d894fc3720ea69b24e61dd3b480be62608b2ad96955a22053ae5a31e92a20f')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
