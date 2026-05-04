# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libcoopgamma
pkgver=1.2.5
pkgrel=1
pkgdesc="Cooperative gamma library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libcoopgamma"
license=('custom:ISC')
depends=(coopgammad)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c74e1d65ea85257954c6b41804d59b5226ca850b3f74fc4bcdf4d9b0df8ca788)


build() {
    cd "$srcdir/$pkgname"
    make
}

check() {
    cd "$srcdir/$pkgname"
    make check
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
