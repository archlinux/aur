# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=frame-x-server
pkgver=0.0.146
pkgrel=1
pkgdesc='X11 display server for the CHasm desktop written in x86_64 assembly'
arch=('x86_64')
url='https://github.com/isene/frame/'
license=('Unlicense')
makedepends=(
    'nasm')
source=("https://github.com/isene/frame/archive/v${pkgver}/frame-x-server-${pkgver}.tar.gz")
sha256sums=('384a0eae7ad26d8173e62a48690df814bab499eaebdbd46739a886aeadf7a8fd')

build() {
    make -C "frame-${pkgver}"
}

package() {
    make -C "frame-${pkgver}" DESTDIR="$pkgdir" PREFIX='/usr' install
}
