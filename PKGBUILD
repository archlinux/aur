# Maintainer: Elvis Angelaccio <elvis dot angelaccio at kde dot org>

pkgname=kronometer
pkgver=2.2.1
pkgrel=1
pkgdesc="A simple chronometer application."
arch=('i686' 'x86_64')
url="https://userbase.kde.org/Kronometer"
license=('GPL2')
depends=('kxmlgui' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kronometer-git')
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('7d4092e576f9b0be20d5b36c57eee089964f8215672be88797c8c2b44ac462a1')

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
