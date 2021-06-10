# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=calindori
pkgver=21.06
pkgrel=2
pkgdesc="Calendar for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/calindori"
license=(GPL3)
depends=('ki18n' 'kcoreaddons' 'kconfig' 'kcalendarcore' 'kirigami2'
         'kdbusaddons' 'knotifications' 'kservice' 'kpeople')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-svg')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('48dc162edb457d164ca371eb006c7e9b7ddb8d54f49b66a6bf7db1776cf26e47')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
