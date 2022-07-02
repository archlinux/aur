# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kweather
pkgver=22.06
pkgrel=1
pkgdesc="Weather application for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/kweather"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kcoreaddons' 'knotifications' 'kirigami2'
         'kdbusaddons' 'plasma-framework' 'kweathercore')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-svg')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f317d9a978e4cfab350fc0eda7bbe90315033eb6eec13d6c73e19bbb3fd78728')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
