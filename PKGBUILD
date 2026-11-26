# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libgammamm
pkgver=1.1
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and C++"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libgammamm"
license=('custom:ISC')
depends=('libgamma>=0.9' glibc gcc-libs)
makedepends=('libgamma>=0.9' glibc gcc-libs)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(9d988d730d0d4c36d7f35e8fc131709b8e57c87b57a31f9086d1ad74866dd169)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
