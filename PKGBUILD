# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libgammamm
pkgver=1.0.3
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and C++"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libgammamm"
license=('custom:ISC')
depends=('libgamma>=0.7.4' glibc gcc-libs)
makedepends=('libgamma>=0.7.4' glibc gcc-libs)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(cf55553efe67e138527ff23c4030ed5ca9364fc7f8280d0a3f58ec869d017cfb)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
