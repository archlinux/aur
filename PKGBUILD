# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('grit-task-manager')
srcname="grit"
pkgver=0.2.0
pkgrel=1
pkgdesc="A multitree-based personal task manager"
provides=('grit')
arch=('any')
license=('MIT')
url="https://github.com/climech/grit"
source=("git+${url}.git#tag=v${pkgver}")

sha256sums=('SKIP')

build() {
    cd "${srcname}"
    make
}

package() {
    cd "${srcname}"
    make
    install -Dm 755 -t "${pkgdir}/usr/bin" grit
}
