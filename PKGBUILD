# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kweather
pkgver=0.4
pkgrel=1
pkgdesc="Weather application for Plasma Mobile"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/kweather"
license=(GPL3)
depends=(ki18n kconfig kcoreaddons knotifications kirigami2 kdbusaddons plasma-framework)
makedepends=(extra-cmake-modules qt5-tools)
source=("https://invent.kde.org/plasma-mobile/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('94db92197a871d32a64117a4639e905f874f65f64e8975bf92c32f3fd31c70bd')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname}-${pkgver}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
