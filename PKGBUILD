# Maintainer: shi bowen <sbw /at/ sbw.so>
pkgname=libdui
pkgver=r136.ad37d73
pkgrel=1
pkgdesc="the Qt5 UI library from Deepin."
arch=('x86_64' 'i686')
url="git://gitcafe.com/Hualet/libdui.git"
license=('GPL3')
depends=('gcc-libs' 'qt5-base')
makedepends=('git')
conflicts=('libdui')
provides=('libdui')
install=${pkgname}.install
source=('git://gitcafe.com/Hualet/libdui.git')
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/libdui
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/libdui
    qmake-qt5
    make
}

package() {
    cd ${srcdir}/libdui

    make INSTALL_ROOT="${pkgdir}" install
}
