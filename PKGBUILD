# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=libics
pkgver=1.5.2
pkgrel=1
pkgdesc="the reference library for Image Cytometry Standard, an open standard"
arch=(i686 x86_64)
url=http://libics.sourceforge.net/
license=(LGPL2.1)
depends=(zlib)
source=(http://sourceforge.net/projects/libics/files/libics/libics-${pkgver}.tar.gz)
md5sums=(d394225ae454be05c2440641e40d5408)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
