# Maintainer: Tianhao Chai <cth451@gmail.com>

pkgname=minemap
pkgver=0.5
pkgrel=1
pkgdesc="Converter for Minecraft Map Items"
arch=(x86_64)
url="https://github.com/cthbleachbit/minemap"
license=(LGPLv3)
depends=(nbtp graphicsmagick zlib)
makedepends=(python)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/cthbleachbit/minemap/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('3baa0f939b8f2b4c753d0ed46e6a1558a9174b1856d0c8eb853aa4870ffec54b1ddfb970298a2bcf226d2ea9bd5ca85ea7f54857899894478f9f87fe6867a8ab')

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
