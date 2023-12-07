# shellcheck shell=bash
pkgname="fennel-ls"
pkgrel=1
pkgver=0.1.0
pkgdesc="Language Server for Fennel"
arch=("any")
url="https://sr.ht/~xerool/fennel-ls"
license=("MIT")
depends=("lua")
makedepends=("make" "git")
source=("https://git.sr.ht/~xerool/fennel-ls/archive/0.1.0.tar.gz")
b2sums=("ed542bb4a588f1e4708d0d7c895bf58800b57e42e0db7cf3f34ee18d5962f693b4ead03c2095b8a87d97db401f1e4c5d7236400c2d8f128847f8bb0a0c8bf2a3")
conflicts=("${pkgname}-git")

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr"
}
