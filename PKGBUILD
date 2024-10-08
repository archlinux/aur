# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=pylibgamma
pkgver=1.1.4
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Python 3"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/pylibgamma"
license=('custom:ISC')
depends=(python3 'libgamma>=0.7.4')
makedepends=(python3 'libgamma>=0.7.4' cython pkg-config)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(b7034aff4b82229d21e09be21b295aeb1f0ca4070c0b6118925f633e6929b81cbf6ff99cb864ec47b7ef2959099110104a898475c38b45249154b0789708a437)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
