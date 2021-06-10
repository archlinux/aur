# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kweathercore
pkgver=0.3
pkgrel=1
pkgdesc="Library to facilitate retrieval of weather information including forecasts and alerts"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/libraries/kweathercore"
license=(GPL3)
depends=('ki18n' 'qt5-location')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools')
source=("git+${url}.git#commit=4690eee9843f62b69b5225eaefac4b30417c161f")
sha256sums=('SKIP')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname%-git}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}