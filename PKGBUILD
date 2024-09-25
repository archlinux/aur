# Maintainer: Mattias Andrée <`base64 -d`(bWF0dGlhcy5hbmRyZWU)@protonmail.com>

pkgname=libcoopgamma
pkgver=1.2.3
pkgrel=1
pkgdesc="Cooperative gamma library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libcoopgamma"
license=('ISC')
depends=(coopgammad)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(8f0c5324e914cda02673cbc66f298bfe3bde2cb174d81a59a5994d4b1ae32e9f71a79a19cacbb046c3919d418cc860e830669f9eaa4eac3ee525f070c00222a4)


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
