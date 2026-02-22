# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=pylibgamma
pkgver=1.1.5
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Python 3"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/pylibgamma"
license=('custom:ISC')
depends=(python3 'libgamma>=0.7.4')
makedepends=(python3 'libgamma>=0.7.4' cython pkg-config)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ece6fbdff5e0a86de57484c66265183b63964d494b5ae2bb7a8473a5c9e3c3da)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
