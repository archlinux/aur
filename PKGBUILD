# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=calindori
pkgver=22.06
pkgrel=1
pkgdesc="Calendar for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/calindori"
license=('GPL3')
depends=('ki18n' 'kcoreaddons' 'kconfig' 'kcalendarcore' 'kirigami2'
         'kdbusaddons' 'knotifications' 'kservice' 'kpeople')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-svg')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('073c396948a1565d2c5007a9da2ebed7f152a2e989a98dc337ade9e8c39c8b39')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
