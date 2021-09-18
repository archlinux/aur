# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libhaiku
pkgver=2.0.1
pkgrel=1
pkgdesc="Poetic error messages"
arch=(x86_64 i686)
url="https://github.com/maandree/libhaiku"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(595537127f5206008f48b365362e447a3ca45a705473e31416cca8f09160e169)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
