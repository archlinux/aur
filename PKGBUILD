# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-dialer-git
pkgver=21.06
pkgrel=1
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
pkgdesc="Dialer for Plasma Mobile"
url="https://invent.kde.org/plasma-mobile/plasma-dialer"
license=('GPL2')
depends=('kcontacts' 'kirigami2' 'ki18n' 'kconfig' 'kpeople' 'kcoreaddons' 'kdbusaddons'
         'knotifications' 'libqofono-git' 'telepathy-qt' 'libpulse' 'libphonenumber')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('SKIP')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}