# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=alligator
pkgver=22.06
pkgrel=1
pkgdesc="Kirigami-based RSS reader"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/alligator"
license=('GPL3')
depends=('ki18n' 'kcoreaddons' 'kconfig' 'syndication' 'kirigami2')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-svg')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ae76960d29e247c7150114a097b860b483dddebcc230a9624076c6583f5792c0')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
