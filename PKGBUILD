# Maintainer: Pascal Pollet <paspol@gmx.de>
pkgname=babeleo
pkgver=0.13.2
pkgrel=1
pkgdesc="KDE Plasma 6 applet for quick lookups in translation services or other web services"
arch=('x86_64')
url="https://github.com/tryptophane/babeleo-plasma"
license=('GPL-2.0-or-later')
depends=(
    'libplasma'
    'kcoreaddons'
    'ki18n'
    'kconfig'
    'kglobalaccel'
    'kio'
    'kwidgetsaddons'
    'kxmlgui'
    'kwindowsystem'
    'qt6-base'
    'wl-clipboard'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tryptophane/babeleo-plasma/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f55949140b4c2327803d2a23abae3617ba60a1eb6a30daaba04c6e1036730b13')

build() {
    cmake -B build -S "babeleo-plasma-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
