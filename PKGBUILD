# Maintainer: Europrimus <aur-g4gra@c-f.me>
# Contributor: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.28.0
pkgrel=1
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
makedepends=('python')
url='https://github.com/micropython/micropython/tree/master/mpy-cross'
source=("https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.xz")
sha256sums=('4e43c59657b8da33b4bc503509a827cc3ea6cb66c446475c57776cf4467ba215')

build() {
    cd "micropython-${pkgver}/mpy-cross"
    make --jobs
}

package() {
    cd "micropython-${pkgver}/mpy-cross"
    install -Dm0755 build/mpy-cross "${pkgdir}/usr/bin/mpy-cross"
}

