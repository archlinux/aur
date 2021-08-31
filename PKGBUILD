# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kweather
pkgver=21.08
pkgrel=1
pkgdesc="Weather application for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/kweather"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kcoreaddons' 'knotifications' 'kirigami2'
         'kdbusaddons' 'plasma-framework' 'kweathercore')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-svg')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('c5c572b38d6e74e15998273fcff9438711b0f6f550fe23908156f3a934973f2c')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
