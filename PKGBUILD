# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=oxfmt-bin
pkgver=0.44.0
oxlint_pkgver=1.59.0
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

sha256sums_x86_64=('5abc9af3aa97f7376cd2f105159ddd36e23c487414267ffcc7058682271caa3c')
sha256sums_aarch64=('5ee54642ebeda99be17bae3af8e297be68119d0a14f519f23a48df7796250737')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxfmt"
}
