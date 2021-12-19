# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=calindori
pkgver=21.12
pkgrel=1
pkgdesc="Calendar for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/calindori"
license=('GPL3')
depends=('ki18n' 'kcoreaddons' 'kconfig' 'kcalendarcore' 'kirigami2'
         'kdbusaddons' 'knotifications' 'kservice' 'kpeople')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-svg')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2bc72b24d96499afb1418c6de3657a7639a74076a04eb43e3fbc5c08567ba9e6')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
