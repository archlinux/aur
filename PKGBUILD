# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>
pkgname=i7z
pkgver=0.27
pkgrel=1
pkgdesc="A better i7 (and now i3, i5) reporting tool for Linux"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ncurses' 'qt')
url="http://code.google.com/p/i7z/"
source=("http://i7z.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
install="i7z.install"
md5sums=('85727aad6d5082b3448caba4a2c74506')

build() {
    cd ${srcdir}/${pkgname}
    make
## Make GUI
    cd GUI
    qmake
    make
}
package() {
    cd ${srcdir}/${pkgname}
    install -Dm 755 i7z ${pkgdir}/usr/bin/i7z
    install -Dm 755 GUI/GUI ${pkgdir}/usr/bin/i7z-gui
}
