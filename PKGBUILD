# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=kongress
pkgver=1.0
pkgrel=2
pkgdesc="Companion application for conferences"
arch=($CARCH)
url="https://github.com/KDE/kongress"
license=(BSD GPL LGPL)
depends=(hicolor-icon-theme kcalendarcore kdbusaddons ki18n knotifications)
makedepends=(extra-cmake-modules kconfig kcoreaddons kirigami2 qt5-base qt5-declarative qt5-imageformats qt5-quickcontrols2 qt5-svg qt5-wayland qt5-webengine)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('da8527d0bb0b9fe3d58b1dac8a251046e3ad29eaef6212f6f6aa5f984c6592a3')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
