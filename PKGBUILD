# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('grit-task-manager')
_srcname="grit"
pkgver=0.3.0
pkgrel=1
pkgdesc="A multitree-based personal task manager"
provides=('grit')
arch=('any')
license=('MIT')
url="https://github.com/climech/grit"
source=("git+${url}.git#tag=v${pkgver}")
makedepends=('go' 'git')

sha256sums=('SKIP')

build() {
    cd "${_srcname}"
    make
}

package() {
    cd "${_srcname}"
    make
    install -Dm 755 -t "${pkgdir}/usr/bin" grit
}
