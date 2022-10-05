# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-dialer
pkgver=22.09
pkgrel=1
pkgdesc="Dialer for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-dialer"
license=('GPL2')
depends=('kcontacts' 'kirigami2' 'ki18n' 'kconfig' 'kpeople' 'kcoreaddons' 'kdbusaddons'
         'knotifications' 'libqofono-git' 'telepathy-qt' 'libpulse' 'libphonenumber')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools' 'reuse')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('3a27d12290762977109290a86c6bcf21b20703e7da4e8fe31ea595c068c168f2')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
