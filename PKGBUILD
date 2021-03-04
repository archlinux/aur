# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=calindori
pkgver=1.4
pkgrel=2
pkgdesc="Calendar for Plasma Mobile"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/calindori"
license=(GPL3)
depends=(ki18n kcoreaddons kconfig kcalendarcore kirigami2
         kdbusaddons knotifications kservice kpeople qt5-svg)
makedepends=(extra-cmake-modules qt5-tools)
source=("https://download.kde.org/stable/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('20b43e406a40fce2cd4b82c6a7a2e54668c55251a80364019adc4809cb3cc680')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname}-${pkgver}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
