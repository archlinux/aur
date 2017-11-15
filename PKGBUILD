# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=i7z
pkgver=0.27.2.git1
pkgrel=4
pkgdesc="A better i7 (and now i3, i5) reporting tool for Linux"
arch=('x86_64')
license=('GPL2')
depends=('ncurses')
makedepends=('qt4' 'git')
optdepends=('qt4: for i7z-gui')
url="https://github.com/ajaiantilal/i7z"
source=(git://github.com/ajaiantilal/i7z.git#commit=5023138)
md5sums=('SKIP')

build() {
    cd ${srcdir}/${pkgname}

    make

    cd GUI
    qmake-qt4
    make clean
    make
}
package() {
    cd ${srcdir}/${pkgname}

    install -Dm 755 i7z ${pkgdir}/usr/bin/i7z
    install -Dm 755 GUI/i7z_GUI ${pkgdir}/usr/bin/i7z-gui
}
