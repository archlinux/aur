# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libparsepsf
pkgver=1.0.3
pkgrel=1
pkgdesc="C library for interpreting PSF (PC Screen Font) files"
arch=(x86_64)
url="https://codeberg.org/maandree/libparsepsf"
license=('custom:ISC')
depends=('libgrapheme>=1.0')
makedepends=('libgrapheme>=1.0')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(310c077d709c494bc9f9befc87d59e21b0de0fff5a19c0bf8a75a6d3d27cd003)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
