# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=gnu-apl
pkgver=1.6
pkgrel=1
url="http://www.gnu.org/software/apl/"
pkgdesc="An (almost) complete implementation of ISO standard 13751"
arch=('i686' 'x86_64')
depends=('ncurses' 'postgresql-libs' 'gcc-libs' 'sqlite')
license=('GPL3')
source=("ftp://ftp.gnu.org/gnu/apl/apl-${pkgver}.tar.gz")
md5sums=('b439722cf8cace8e422d3424034e4c7f')

build() {
    cd "$srcdir/apl-$pkgver"
    CFLAGS='-std=gnu99' ./configure --prefix=/usr 
    make PREFIX=/usr -j1
}

package() {
    cd "$srcdir/apl-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

