# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libparsepsf
pkgver=1.0.4
pkgrel=1
pkgdesc="C library for interpreting PSF (PC Screen Font) files"
arch=(x86_64)
url="https://codeberg.org/maandree/libparsepsf"
license=('custom:ISC')
depends=('libgrapheme>=1.0')
makedepends=('libgrapheme>=1.0')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(cda288bd17be50cd7ec9425c0d80af4a2a8ef3a9868621872d83fb0fe7c4eddf)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
