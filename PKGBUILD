# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.23.0
pkgrel=1
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
url=https://github.com/micropython/micropython/tree/master/mpy-cross
source=(https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.xz)
sha256sums=('0ab283c2fc98d466c1ff26692bee46abaeeab55d488a36fc3cb6372cb8fb390d')

build() {
    cd micropython-${pkgver}/mpy-cross
    make -j4
}

package() {
    cd micropython-${pkgver}/mpy-cross
    install -Dm0755 build/mpy-cross ${pkgdir}/usr/bin/mpy-cross
}

