# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libutf8
pkgver=1.0
pkgrel=1
pkgdesc="UTF-8 encoding and decoding library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libutf8"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8ed3e6c3501450cf879f9eb09d12305bed965256f542407cb3d6e5664c8ddd4d)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
