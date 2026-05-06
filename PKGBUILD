# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libsimple
pkgver=1.8
pkgrel=1
pkgdesc="A bunch of C functions that are useful when writing simple code"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libsimple"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(23e390f3e201d6fb6f222e96612daab1d697998db3fa6026cdf2e733ab93be0f)


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
