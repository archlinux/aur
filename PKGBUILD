# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.12
pkgrel=2
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
url=https://github.com/micropython/micropython/tree/master/mpy-cross
source=(https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.gz)
sha256sums=('be2041924496f49b580f06c2d328c7757bbc7b62408abb11841ebeb87302c575')

build() {
    cd micropython-${pkgver}/mpy-cross
    make
}

package() {
    cd micropython-${pkgver}/mpy-cross
    install -Dm0755 mpy-cross ${pkgdir}/usr/bin/mpy-cross
}

