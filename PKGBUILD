# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=krecorder
pkgver=21.12
pkgrel=1
pkgdesc="A convergent audio recording application for Plasma"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/krecorder"
license=('GPL3')
depends=('ki18n' 'kconfig' 'qt5-multimedia' 'kirigami2')
makedepends=('qt5-svg' 'qt5-tools' 'extra-cmake-modules')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('9c84d62cd658ca842a04eb49447bc4e0332a8bf3f23dab300306aa24fc45b109')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
