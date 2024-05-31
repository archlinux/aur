# Maintainer: Balazs Brunaczky <balazs.brunaczky@gmail.com>

pkgname=expressvpn-applet
pkgver=0.1
pkgrel=1
pkgdesc="Unofficial applet for ExpressVPN"
arch=("x86_64")
url="https://github.com/bbrunaczky/${pkgname}"
license=("GPL-3")
depends=("boost" "gtkmm3")
makedepends=("cmake")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('577cad20118139fd809339ff486021af7e4e4f42c17b7077f7414858acea083a')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    cmake . -B build -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DCMAKE_BUILD_TYPE=Release
}


build() {
    cd "${pkgname}-${pkgver}"
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"
    cmake --install build
}
