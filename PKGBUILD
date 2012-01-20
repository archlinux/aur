# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=i7z
pkgver=0.27.1
pkgrel=1
pkgdesc="A better i7 (and now i3, i5) reporting tool for Linux"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ncurses')
makedepends=('qt')
optdepends=('qt: for i7z-gui')
url="http://code.google.com/p/i7z/"
source=("http://i7z.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('4408e0e39b195b8fe6383cadc971a862')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    make

    cd GUI
    qmake
    make clean
    make
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    install -Dm 755 i7z ${pkgdir}/usr/bin/i7z
    install -Dm 755 GUI/i7z_GUI ${pkgdir}/usr/bin/i7z-gui
}
