# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-dialer
pkgver=22.02
pkgrel=1
pkgdesc="Dialer for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-dialer"
license=('GPL2')
depends=('kcontacts' 'kirigami2' 'ki18n' 'kconfig' 'kpeople' 'kcoreaddons' 'kdbusaddons'
         'knotifications' 'libqofono-git' 'telepathy-qt' 'libpulse' 'libphonenumber')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools' 'reuse')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ff6f8a8bc450ee37a45bf60d76a9c8fe70fdc6113f6a24c42497c8bf44b88cb6')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
