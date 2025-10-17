# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.26.1
pkgrel=1
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
makedepends=('python')
url='https://github.com/micropython/micropython/tree/master/mpy-cross'
source=("https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.xz")
sha256sums=('12be6514df6272c0fcb328122b534af6b12abdd52435c19f40ee1707cc43ac98')

build() {
    cd "micropython-${pkgver}/mpy-cross"
    make
}

package() {
    cd "micropython-${pkgver}/mpy-cross"
    install -Dm0755 build/mpy-cross "${pkgdir}/usr/bin/mpy-cross"
}

