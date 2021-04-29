# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=calindori
pkgver=1.4
pkgrel=3
pkgdesc="Calendar for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/calindori"
license=(GPL3)
depends=('ki18n' 'kcoreaddons' 'kconfig' 'kcalendarcore' 'kirigami2'
         'kdbusaddons' 'knotifications' 'kservice' 'kpeople')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-svg')
source=("https://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('20b43e406a40fce2cd4b82c6a7a2e54668c55251a80364019adc4809cb3cc680')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
