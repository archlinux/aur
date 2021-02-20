# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libcoopgamma
pkgver=1.2.2
pkgrel=1
pkgdesc="Cooperative gamma library"
arch=(i686 x86_64)
url="https://github.com/maandree/libcoopgamma"
license=('custom:ISC')
depends=(coopgammad)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(a1c2dba55a49e77741f55943b5d4539cd0349c4ddbb41482c485d2820387597a)


build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}
