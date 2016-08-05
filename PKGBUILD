# Maintainer: Elvis Angelaccio <elvis dot angelaccio at kdemail dot net>

pkgname=kronometer
pkgver=2.1.1
pkgrel=1
pkgdesc="A simple chronometer application."
arch=('i686' 'x86_64')
url="http://aelog.org/kronometer"
license=('GPL2')
depends=('kxmlgui' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kronometer-git')
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('ecb182e6ef6cf33a7c3a068edb6ac243caa43ff386f1c331bb3a2d197eae4b00')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
