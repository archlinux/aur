# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libcoopgamma
pkgver=1.2.4
pkgrel=1
pkgdesc="Cooperative gamma library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libcoopgamma"
license=('ISC')
depends=(coopgammad)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(c20eb2c8d453b8ae29b612c04c58d61312fc78fc078f287b57cc01cd7b0a83512ec4b30d16daaf4222e144ad472e7b705365bf4d1a16098a7d6cad3f9c074cf4)


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
