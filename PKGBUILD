# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kweather
pkgver=22.09
pkgrel=1
pkgdesc="Weather application for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/kweather"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kcoreaddons' 'knotifications' 'kirigami2'
         'kdbusaddons' 'plasma-framework' 'kweathercore')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-svg')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('5f864f8f9ee8d17dc0647806c9237efd4df82ee31d022e80cf32e4e053317f7c')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
