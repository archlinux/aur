# Maintainer: Rocket Aaron <i at rocka dot me>

pkgname=plasma-applet-netspeed-widget
pkgver=3.1
pkgrel=1
pkgdesc='Plasma 6 widget that displays the currently used network bandwidth'
arch=('any')
url='https://github.com/dfaust/plasma-applet-netspeed-widget'
license=('GPL-2.0-only')
depends=('plasma-workspace' 'awk')
optdepends=('kdeplasma-addons')
makedepends=('cmake' 'extra-cmake-modules')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dfaust/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b70b46b8777734de23e5788dcf61729ef9428e63ebc1b722fe4682a51d3759d33069b4980df17f4f566c45aa50bd3a2bf526383b20013cad17ae35326805d2cb')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
      -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
