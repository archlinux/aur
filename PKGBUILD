# Maintainer: Elvis Angelaccio <elvis dot angelaccio at kde dot org>

pkgname=kronometer
pkgver=2.2.0
pkgrel=1
pkgdesc="A simple chronometer application."
arch=('i686' 'x86_64')
url="https://userbase.kde.org/Kronometer"
license=('GPL2')
depends=('kxmlgui' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kronometer-git')
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('ee533762ffaa78a39a2ba3b45c71ee2ec2e72ca59e989255cdc1a0cc01fe3b30')

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
