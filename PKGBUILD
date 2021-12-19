# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=alligator
pkgver=21.12
pkgrel=1
pkgdesc="Kirigami-based RSS reader"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/alligator"
license=('GPL3')
depends=('ki18n' 'kcoreaddons' 'kconfig' 'syndication' 'kirigami2')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-svg')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7c5a8d05f241c0ba774b6a8da11c0b04098ca34fd3fa62fd11b6055b56ba8e3c')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
