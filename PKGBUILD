# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.22.0
pkgrel=1
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
url=https://github.com/micropython/micropython/tree/master/mpy-cross
source=(https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.xz)
sha256sums=('a042764f0b6f6d92b267454c5bd5afcb83fc3900119f2583672aac571e661924')

build() {
    cd micropython-${pkgver}/mpy-cross
    make
}

package() {
    cd micropython-${pkgver}/mpy-cross
    install -Dm0755 build/mpy-cross ${pkgdir}/usr/bin/mpy-cross
}

