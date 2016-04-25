# Maintainer: Elvis Angelaccio <elvis dot angelaccio at kdemail dot net>

pkgname=kronometer
pkgver=2.1.0
pkgrel=1
pkgdesc="A simple chronometer application."
arch=('i686' 'x86_64')
url="http://aelog.org/kronometer"
license=('GPL2')
depends=('kxmlgui' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kronometer-git')
install=$pkgname.install
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('316fc42b6ff55c90d14bb04f9e4b5947c828d1161ad9e24af14ce71118f107da')

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
