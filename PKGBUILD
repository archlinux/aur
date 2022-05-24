# Forked from https://aur.archlinux.org/pkgbase/qtcreator-src/

pkgname=qtcreator-src-git
pkgver=7.0.2.r809.gf54097fefb
pkgrel=1
pkgdesc="Source code of Qt Creator IDE needed to build plugins"
arch=('any')
url='https://www.qt.io'
license=('LGPL')
depends=()
options=('!strip')
makedepends=()
provides=("qtcreator-src=$pkgver")
conflicts=(qtcreator-src)
source=("git+https://code.qt.io/qt-creator/qt-creator.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/qt-creator
    git describe --long --match v* | sed -r 's/([^-]*-g)/r\1/;s/-/./g' | sed -r 's/v//g'
}

build() {
    rm -rf ${srcdir}/qt-creator/.git*
    rm -rf ${srcdir}/qt-creator/tests
}

package () {
    mkdir -p "$pkgdir/usr/src/"
    cp -r "${srcdir}/qt-creator" "$pkgdir/usr/src/qtcreator"
} 
