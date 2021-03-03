# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=calindori
pkgver=1.4
pkgrel=1
pkgdesc="Calendar for Plasma Mobile"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/calindori"
license=(GPL3)
depends=(ki18n kcoreaddons kconfig kcalendarcore kirigami2
         kdbusaddons knotifications kservice kpeople qt5-svg)
makedepends=(extra-cmake-modules qt5-tools)
source=("https://invent.kde.org/plasma-mobile/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('ec7481958e3b378cf2b0e36b98892b642b2f267b727fc3770754540de3c365cc')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname}-v${pkgver}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
