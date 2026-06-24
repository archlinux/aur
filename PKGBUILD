# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=photoqt-extensions
pkgver=5.4
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
sha256sums=('a9719264066327d78a75573290f0b0489faf67c0bc1ad30c8c8ce406dfe275f4')

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
