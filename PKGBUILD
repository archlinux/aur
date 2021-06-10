# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-angelfish
pkgver=21.06
pkgrel=2
arch=(x86_64 i686 arm armv6h armv7h aarch64)
pkgdesc="Web browser for Plasma Mobile"
url="https://invent.kde.org/plasma-mobile/angelfish"
license=('GPL2')
depends=('qt5-webengine' 'qt5-feedback' 'purpose' 'kirigami2' 'ki18n' 'kconfig'
         'kcoreaddons' 'kdbusaddons' 'kwindowsystem' 'knotifications')
makedepends=('extra-cmake-modules' 'corrosion-git' 'qt5-svg' 'qt5-tools')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/angelfish-${pkgver}.tar.xz")
sha256sums=('8878261bf0de6943e7457955214f0ffe851c6083627a7626476cc8f50e18777b')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S angelfish-${pkgver}
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
