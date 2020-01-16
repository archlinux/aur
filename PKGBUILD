# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.12
pkgrel=1
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
url=https://github.com/micropython/micropython/tree/master/mpy-cross
source=(https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.gz)
b2sums=('c95907e0f03b3dba69b4f756915258e4ef212e4b3d78f89af9daa723d029ae7823b5a6b426bc9536fe58b46d90918d98c08f33e4f6c381a747482992b6931c68')

build() {
    cd micropython-${pkgver}/mpy-cross
    make
}

package() {
    cd micropython-${pkgver}/mpy-cross
    install -Dm0755 mpy-cross ${pkgdir}/usr/bin/mpy-cross
}

