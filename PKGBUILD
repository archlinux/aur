# Forked from https://aur.archlinux.org/pkgbase/qtcreator-src/

pkgname=qtcreator-src-git
pkgver=v5.0.0.beta1.r31.g58d00f37d4
pkgrel=1
pkgdesc="Source code of Qt Creator IDE needed to build plugins"
arch=('any')
url='https://www.qt.io'
license=('LGPL')
depends=()
options=('!strip')
makedepends=()
conflicts=(qtcreator-src)
source=("git+https://code.qt.io/qt-creator/qt-creator.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/qt-creator
    git describe --long --match v* | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    rm -rf ${srcdir}/qt-creator/.git*
    rm -rf ${srcdir}/qt-creator/tests
}

package () {
    mkdir -p "$pkgdir/usr/src/"
    cp -r "${srcdir}/qt-creator" "$pkgdir/usr/src/qtcreator"
} 
