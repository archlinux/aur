# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libparsepcf
pkgver=2.0
pkgrel=1
pkgdesc="C library for interpreting PCF (Portable Compiled Format) font files"
arch=(x86_64)
url="https://codeberg.org/maandree/libparsepcf"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(84d20a5e3d7d34a9789001d6c47584f3e15c6e6bf6f8c2eb6712b4f6c9986e6a)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
