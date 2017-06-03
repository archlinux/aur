# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='cen64'
pkgver=0.3
pkgrel=1
pkgdesc='Cycle-accurate Nintendo 64 emulator'
arch=('i686' 'x86_64')
url='http://www.cen64.com/'
license=('BSD')
depends=('mesa' 'openal')
makedepends=('cmake')
provides=('cen64')
conflicts=('cen64')
source=('https://github.com/tj90241/cen64/archive/v0.3.tar.gz')
sha256sums=('0e6330a51b606805ff4224d88f17940936cb5dc4c27a64e11e2fcfe240e496b5')

prepare() {
    mkdir -p build
}

build() {
    cd "${pkgname}-${pkgver}/build"

    cmake ..
    make cen64
}

package() {
    cd "${pkgname}-${pkgver}"

    install -D -m 755   \
        build/cen64     \
        "${pkgdir}/usr/bin/cen64"
    install -D -m 644   \
        LICENSE         \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
