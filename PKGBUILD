# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: William Gathoye <william + aur at gathoye dot be>
pkgname=plasma5-applets-netspeed
pkgver=2.0
pkgrel=1
pkgdesc="Plasma 5 widget that displays the currently used network bandwidth"
arch=('any')
url="https://github.com/dfaust/plasma-applet-netspeed-widget"
license=('GPL2')
depends=(
    'awk'
    'plasma-workspace'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dfaust/plasma-applet-netspeed-widget/archive/v${pkgver}.tar.gz")
b2sums=('7b89060c2eeba04e35c5ed6c99add01cb91616f801cc6c2ac1ed2efea459c552ddd50a0c54efee7da8fe132c22b5860b17965748118aeebf00a4797dbd990a34')

build() {
    cmake -B build -S "plasma-applet-netspeed-widget-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

