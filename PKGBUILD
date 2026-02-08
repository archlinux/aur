# Maintainer: Europrimus <aur-g4gra@c-f.me>
# Contributor: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.27.0
pkgrel=1
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
makedepends=('python')
url='https://github.com/micropython/micropython/tree/master/mpy-cross'
source=("https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.xz")
sha256sums=('9874b20646c3bbe81d524f779a16875e5d088b7065e175ffd2aa2a02f50573c9')

build() {
    cd "micropython-${pkgver}/mpy-cross"
    make --jobs
}

package() {
    cd "micropython-${pkgver}/mpy-cross"
    install -Dm0755 build/mpy-cross "${pkgdir}/usr/bin/mpy-cross"
}

