# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=kongress
pkgver=22.09
pkgrel=1
pkgdesc="Companion application for conferences"
arch=($CARCH)
url="https://github.com/KDE/kongress"
license=(BSD GPL LGPL)
depends=(hicolor-icon-theme kcalendarcore kdbusaddons ki18n knotifications)
makedepends=(extra-cmake-modules kconfig kcoreaddons kirigami2 qt5-base qt5-declarative qt5-imageformats qt5-quickcontrols2 qt5-svg qt5-wayland qt5-webengine)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('24f1ff4a52b74dc1ade852154016d95d3ed7e81f74ed2a3d123b5acef045dd37')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
