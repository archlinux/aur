# Maintainer: Pascal Pollet <paspol@gmx.de>
pkgname=babeleo
pkgver=0.13.0
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
sha256sums=('82f6936c2764bf057ee591710dd2936b6c40dec0ddbbf5b90b0c5a36380718f5')

build() {
    cmake -B build -S "babeleo-plasma-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
