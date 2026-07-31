# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=photoqt-extensions
pkgver=5.4.1
pkgrel=1
pkgdesc="Extensions for PhotoQt image viewer"
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
conflicts=('photoqt-extensions-bin' 'photoqt-extensions-bin-debug')
provides=('photoqt-extensions-debug')
depends=('exiv2')
makedepends=('cmake' 'qt6-tools')
source=(https://photoqt.org/downloads/extensions/$pkgname-$pkgver.tar.gz)
sha256sums=('4b6bbd0b7abddfc3fb502317e8c2a9b881005ce2db6b866884e88fbba2e13491')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
