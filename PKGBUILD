# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qmlkonsole
pkgver=22.02
pkgrel=1
pkgdesc="Terminal app for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/qmlkonsole"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kirigami2' 'qmltermwidget')
makedepends=('git' 'qt5-tools' 'qt5-svg' 'extra-cmake-modules')
source=("http://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('983a391546ce10c1cb5e3bcc87baeda459b9da885028f586ab7de9eeccad6d57')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
