# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libparser
pkgver=1.1.1
pkgrel=1
pkgdesc="Context-free grammar parsing library"
arch=(x86_64)
url="https://github.com/maandree/libparser"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libparser-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(76b3a146be70ba1e413bcfef1cbcbfa0a4f4731aea349e86a266c2e9d8f32106)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
