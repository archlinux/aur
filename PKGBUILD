# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=frame-x-server
pkgver=0.0.150
pkgrel=1
pkgdesc='X11 display server for the CHasm desktop written in x86_64 assembly'
arch=('x86_64')
url='https://github.com/isene/frame/'
license=('Unlicense')
makedepends=(
    'nasm')
source=("https://github.com/isene/frame/archive/v${pkgver}/frame-x-server-${pkgver}.tar.gz")
sha256sums=('717c51d6befff6d09e3f29fcefc59894075250a0b497e5cc67ddb2998bf76534')

build() {
    make -C "frame-${pkgver}"
}

package() {
    make -C "frame-${pkgver}" DESTDIR="$pkgdir" PREFIX='/usr' install
}
