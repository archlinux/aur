# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=linchat
pkgver=1.0
pkgrel=4
pkgdesc="simple chat program for local Unix users"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.butschek.de/oldblog/2009/04/29/linchat/"
depends=('ncurses' 'gcc-libs')
source=("http://www.butschek.de/files/stuff/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "linchat-1.0-cpp_fixes.patch")
md5sums=('9022b988c4c32b073da291eb888ec688'
         'baf8f7b725172c4ef61b04006dd2f690')

build() {
    cd $srcdir/$pkgname-$pkgver
    patch -i ../${pkgname}-${pkgver}-cpp_fixes.patch
    make
}

package() {
    install -D -m755 $srcdir/$pkgname-$pkgver/linchat ${pkgdir}/usr/bin/linchat
}
