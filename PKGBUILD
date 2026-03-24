# Contributor: Sebastien Waegeneire <sebastien@waegeneire.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=oxlint-bin
pkgver=1.57.0
pkgrel=1
pkgdesc="A high-performance linter for JavaScript and TypeScript built on the Oxc compiler stack"
arch=('x86_64' 'aarch64')
url='https://oxc.rs'
license=('MIT')
provides=('oxlint')
conflicts=('oxlint')

_github_url="https://github.com/oxc-project/oxc/releases/download/apps_v${pkgver}"
_binary_x86_64="oxlint-x86_64-unknown-linux-gnu"
_binary_aarch64="oxlint-aarch64-unknown-linux-gnu"

source_x86_64=("${_binary_x86_64}-$pkgver.tar.gz::${_github_url}/${_binary_x86_64}.tar.gz")
source_aarch64=("${_binary_aarch64}-$pkgver.tar.gz::${_github_url}/${_binary_aarch64}.tar.gz")

sha256sums_x86_64=('a24a21a3aecbe62d4163c5c8bfdd87fc258a175d920beec54d795ae28778024d')
sha256sums_aarch64=('7b95070fa26fde371bfbb345507eec5bc0f931d68599f44d125649c80a7fbe73')

package() {
    local _binary_var="_binary_${CARCH}"
    install -Dm755 "${!_binary_var}" "${pkgdir}/usr/bin/oxlint"
}
