# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libglibutil
pkgver=1.0.74
pkgrel=1
pkgdesc="Library of glib utilities"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/sailfishos/libglibutil"
license=('BSD')
depends=('glib2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sailfishos/libglibutil/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('39d6230944cccc08f61fd421e4fde2c9d19a575197919d114cb9151088445376250bc251e6a8106e7cbe8a98f0847047ff9e36aaed44d4c28667898f48f5bb15')

build() {
  cd $pkgname-$pkgver
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
