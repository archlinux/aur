# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.13
pkgrel=1
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
url=https://github.com/micropython/micropython/tree/master/mpy-cross
source=(https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.gz)
sha256sums=('9ab32eb2c19a682f6de7e9b4226de849c42cb92e1ecb4cf56438a75d763bd451')

build() {
    cd micropython-${pkgver}/mpy-cross
    make
}

package() {
    cd micropython-${pkgver}/mpy-cross
    install -Dm0755 mpy-cross ${pkgdir}/usr/bin/mpy-cross
}

