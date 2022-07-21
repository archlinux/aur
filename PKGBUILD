# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libgammamm
pkgver=1.0.2
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and C++"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libgammamm"
license=('custom:ISC')
depends=('libgamma>=0.3' glibc gcc-libs)
makedepends=('libgamma>=0.3' glibc gcc-libs gcc make coreutils)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(999f7ec89769a6e2b6894b2dee7e2160c97dd473820bce5b2bf8a68a6f4eda1f)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

