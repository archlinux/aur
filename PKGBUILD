# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kalk
pkgver=21.06
pkgrel=1
pkgdesc="Kalk is a powerful cross-platfrom calculator application built with the Kirigami framework"
arch=('x86_64')
url="https://invent.kde.org/plasma-mobile/kalk"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kcoreaddons' 'knotifications' 'kirigami2' 'kunitconversion'
         'kdbusaddons' 'plasma-framework' 'gmp' 'mpfr' 'qt5-feedback')
makedepends=('qt5-tools' 'qt5-svg' 'extra-cmake-modules')
source=("http://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('341432097cede0c1086987bb3c5e244d6214af7f3f192cc7323d27093a2cc612')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
