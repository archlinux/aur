# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=pylibgamma
pkgver=1.2
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Python 3"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/pylibgamma"
license=('custom:ISC')
depends=(python3 'libgamma>=0.9')
makedepends=(python3 'libgamma>=0.9' cython pkg-config)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(b9b7ba3c43c02217320ca48eab9b4d492200a52535587422aac5b2ffa5fc8e46)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
