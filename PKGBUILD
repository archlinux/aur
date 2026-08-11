# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=frame-x-server
pkgver=0.0.151
pkgrel=1
pkgdesc='X11 display server for the CHasm desktop written in x86_64 assembly'
arch=('x86_64')
url='https://github.com/isene/frame/'
license=('Unlicense')
makedepends=(
    'nasm')
source=("https://github.com/isene/frame/archive/v${pkgver}/frame-x-server-${pkgver}.tar.gz")
sha256sums=('bf17287ca324ede5a445c510fe6cd5b2c6f23861269b7ac8792a851723eb30cd')

build() {
    make -C "frame-${pkgver}"
}

package() {
    make -C "frame-${pkgver}" DESTDIR="$pkgdir" PREFIX='/usr' install
}
