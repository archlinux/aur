# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-phonebook
pkgver=22.06
pkgrel=1
pkgdesc="Phone book for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-phonebook"
license=('GPL3')
depends=('ki18n' 'kcoreaddons' 'kconfig' 'kpeople' 'kcontacts' 'kpeoplevcard' 'kirigami2')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1c7d1cec7d6a478c9735a6282428b950a87fc9018a9ae215ab8be4271dbd0902')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
