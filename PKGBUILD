# Maintainer: Europrimus <aur-g4gra@c-f.me>
# Contributor: Ricardo Band <email@ricardo.band>

pkgname=mpy-cross
pkgver=1.29.0
pkgrel=1
pkgdesc="MicroPython cross compiler compiles .py scripts into .mpy files"
arch=('any')
license=('MIT')
makedepends=('python')
url='https://github.com/micropython/micropython/tree/master/mpy-cross'
source=("https://github.com/micropython/micropython/releases/download/v${pkgver}/micropython-${pkgver}.tar.xz")
sha256sums=('d925a7c664e79a2bdf3dfcb285ba5e2237041cc35a0bd4ee573b6c5711efeca0')

build() {
    cd "micropython-${pkgver}/mpy-cross"
    make --jobs
}

package() {
    cd "micropython-${pkgver}/mpy-cross"
    install -Dm0755 build/mpy-cross "${pkgdir}/usr/bin/mpy-cross"
}

