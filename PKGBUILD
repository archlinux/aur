# Maintainer: Elvis Angelaccio <elvis dot angelaccio at kde dot org>

pkgname=kronometer
pkgver=2.1.5
pkgrel=1
pkgdesc="A simple chronometer application."
arch=('i686' 'x86_64')
url="https://userbase.kde.org/Kronometer"
license=('GPL2')
depends=('kxmlgui' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kronometer-git')
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('fcc350666aa86ea3091f0d8bf0d117c8d3a6acd5578d5b51da20a1cb83c4270b')

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
