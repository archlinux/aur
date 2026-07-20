# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=frame-x-server
pkgver=0.0.27
pkgrel=1
pkgdesc='X11 display server for the CHasm desktop written in x86_64 assembly'
arch=('x86_64')
url='https://github.com/isene/frame/'
license=('Unlicense')
makedepends=(
    'nasm')
source=("https://github.com/isene/frame/archive/v${pkgver}/frame-x-server-${pkgver}.tar.gz")
sha256sums=('c189b3ae995945b8bcf260176bd3d23953f9c6f296639600e37acb7b3ccf88e2')

build() {
    make -C "frame-${pkgver}"
}

package() {
    make -C "frame-${pkgver}" DESTDIR="$pkgdir" PREFIX='/usr' install
}
