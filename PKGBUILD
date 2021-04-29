# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-angelfish
pkgver=1.8.0
pkgrel=2
arch=(x86_64 i686 arm armv6h armv7h aarch64)
pkgdesc="Web browser for Plasma Mobile"
url="https://invent.kde.org/plasma-mobile/angelfish"
license=('GPL2')
depends=('qt5-webengine' 'purpose' 'kirigami2' 'ki18n' 'kconfig'
         'kcoreaddons' 'kdbusaddons' 'kwindowsystem' 'knotifications')
makedepends=('extra-cmake-modules' 'corrosion-git' 'qt5-svg' 'qt5-tools')
source=("https://download.kde.org/stable/angelfish/${pkgver}/angelfish-${pkgver}.tar.xz")
sha256sums=('def9a40de962c634304eadb91d505aa21faa70d327270e9de85b34c471ca8cd8')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S angelfish-${pkgver}
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}