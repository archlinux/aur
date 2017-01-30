# Maintainer: Elvis Angelaccio <elvis dot angelaccio at kde dot org>

pkgname=kronometer
pkgver=2.1.3
pkgrel=2
pkgdesc="A simple chronometer application."
arch=('i686' 'x86_64')
url="https://eang.it/kronometer"
license=('GPL2')
depends=('kxmlgui' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kronometer-git')
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('91587ddbfb38df78b6c944f48e6759aa49e0b678afd2aa931a6d54a6d47e06fc')

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
