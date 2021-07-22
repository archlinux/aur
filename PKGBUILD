# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qmlkonsole
pkgver=21.07
pkgrel=1
pkgdesc="Terminal app for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/qmlkonsole"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kirigami2' 'qmltermwidget')
makedepends=('git' 'qt5-tools' 'qt5-svg' 'extra-cmake-modules')
source=("http://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('e8a477e59c22a4263d954063d677091385802e77462af3ffea36feab17da12f9')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
