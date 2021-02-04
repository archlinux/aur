# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=systemd-plasmoid
pkgver=2.0.1
pkgrel=1
pkgdesc="A plasma widget to control systemd services"
arch=($CARCH)
url="https://github.com/jansenm/systemd-plasmoid"
license=(LGPL)
depends=(qt5-declarative)
makedepends=(extra-cmake-modules ki18n knotifications plasma-framework qt5-base)
source=("$pkgname-$pkgver::$url/archive/$pkgver.tar.gz")
sha256sums=('c1a15cc1119d50f86cb9012f575c293766472d737863f91d56e961f2d24218af')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
