# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qmlkonsole
pkgver=21.06
pkgrel=2
pkgdesc="Terminal app for Plasma Mobile"
arch=('x86_64')
url="https://invent.kde.org/plasma-mobile/qmlkonsole"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kirigami2' 'qmltermwidget')
makedepends=('git' 'qt5-tools' 'qt5-svg' 'extra-cmake-modules')
source=("http://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('14f5e79288f53b94b38acd720e9d22eb8667d1a39e24828cad87910e33b03c97')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
