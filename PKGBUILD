# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libglibutil
pkgver=1.0.79
pkgrel=1
pkgdesc="Library of glib utilities"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/sailfishos/libglibutil"
license=('BSD')
depends=('glib2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sailfishos/libglibutil/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ee0b72d859702c142d86a3147fe5fca48ea0296c5aaf63f355fd7f46eaae027481ad1de3a6ebb7c41205ea1a586f0ccfd8fe41b6d3bf6111fa613df69173e3dc')

build() {
  cd $pkgname-$pkgver
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
