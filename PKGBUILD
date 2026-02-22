# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libgammamm
pkgver=1.0.5
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and C++"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libgammamm"
license=('custom:ISC')
depends=('libgamma>=0.7.4' glibc gcc-libs)
makedepends=('libgamma>=0.7.4' glibc gcc-libs)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1e07b452b1926bc17819cd8faf73e3fe3ad34a6702392339f79cb83da2cb9ce6)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
