# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libgammamm
pkgver=1.0.4
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and C++"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libgammamm"
license=('custom:ISC')
depends=('libgamma>=0.7.4' glibc gcc-libs)
makedepends=('libgamma>=0.7.4' glibc gcc-libs)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ad3a5c96865d97b2f800eab7237e722fd13b6db00a1dcb8f2043d9f9dc317775)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
