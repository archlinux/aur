# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=gnu-apl
pkgver=1.5
pkgrel=1
url="http://www.gnu.org/software/apl/"
pkgdesc="an (almost) complete implementation of ISO standard 13751"
arch=('i686' 'x86_64')
license=('GPL3')
source=("ftp://ftp.gnu.org/gnu/apl/apl-${pkgver}.tar.gz")
md5sums=('7302a67330ebdc2224212a1639927bc8')
install=('info.install')

build() {
    cd "$srcdir/apl-$pkgver"
    CFLAGS='-std=gnu99' ./configure --prefix=/usr 
    make PREFIX=/usr -j1
}

package() {
    cd "$srcdir/apl-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

