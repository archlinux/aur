# shellcheck shell=bash
pkgname="fennel-ls"
pkgrel=1
pkgver=0.2.1
pkgdesc="Language Server for Fennel"
arch=("any")
url="https://sr.ht/~xerool/fennel-ls"
license=("MIT")
depends=("lua")
makedepends=("make" "git")
source=("https://git.sr.ht/~xerool/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('fab8201c50088d2517d2086e15402ce90ef9d6b4ae1dfdeff9c22cf48b25dd69581e1d9242e649b2cc037fd1493eeb9dbe3461d5ecc0bf9c79bd966c9fe08d08')
conflicts=("${pkgname}-git")

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr"
}
