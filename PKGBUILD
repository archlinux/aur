# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libglibutil
pkgver=1.0.76
pkgrel=1
pkgdesc="Library of glib utilities"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/sailfishos/libglibutil"
license=('BSD')
depends=('glib2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sailfishos/libglibutil/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f0b35f0366889b6a4c83d73e416a50022f2f0efc08f0fd34b6458c2e8c8b4cabeda6ebbcd3ce9682ab7b92640d956a534683aa2d6773771914ed5dbfb1ad99ee')

build() {
  cd $pkgname-$pkgver
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
