# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=linchat
pkgver=1.0
pkgrel=2
pkgdesc="simple chat program for local Unix users"
arch=('i686')
license=('GPL')
url="http://www.butschek.de/2009/04/linchat/"
depends=('ncurses' 'gcc-libs')
source=("http://www.butschek.de/files/stuff/${pkgname}/${pkgname}-${pkgver}.tar.gz" "http://www.butschek.de/files/stuff/${pkgname}/${pkgname}-${pkgver}-cpp_fixes.patch")
md5sums=('9022b988c4c32b073da291eb888ec688'
         'f3b11840091a6b16db22b83a29509b08')

build() {
    cd $srcdir/$pkgname-$pkgver
    patch < ../${pkgname}-${pkgver}-cpp_fixes.patch
    make
}

package() {
    install -D -m755 $srcdir/$pkgname-$pkgver/linchat ${pkgdir}/usr/bin/linchat
}
