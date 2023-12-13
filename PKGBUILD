# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.21.0
pkgrel=1
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
url=https://github.com/micropython/micropython/tree/master/mpy-cross
source=(https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.xz)
sha256sums=('abd2152613559d3f44728668346e78be9d93458133a03b700baf222c322fd4d5')

build() {
    cd micropython-${pkgver}/mpy-cross
    make
}

package() {
    cd micropython-${pkgver}/mpy-cross
    install -Dm0755 build/mpy-cross ${pkgdir}/usr/bin/mpy-cross
}

