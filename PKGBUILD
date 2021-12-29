# Maintainer: Tianhao Chai <cth451@gmail.com>

pkgname=minemap
pkgver=0.4.5
pkgrel=1
pkgdesc="Converter for Minecraft Map Items"
arch=(x86_64)
url="https://github.com/cthbleachbit/minemap"
license=(LGPLv3)
depends=(nbtp imagemagick zlib)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/cthbleachbit/minemap/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('32313e4146097563a037ea57f9aafe1978363798d8f88762c9c7de555196ef420cfe201f9f0b1b223fa605ece92cffce5002b568ae604864bd6662a2718ea3f7')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make -j
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
