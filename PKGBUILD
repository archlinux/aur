# shellcheck shell=bash
# shellcheck disable=SC2034
declare pkgdir
pkgname="fennel-ls"
pkgrel=2
pkgver=0.2.3
pkgdesc="Language Server for Fennel"
arch=("any")
url="https://sr.ht/~xerool/fennel-ls"
license=("MIT")
depends=("lua")
makedepends=("make" "git" "pandoc")
source=("https://git.sr.ht/~xerool/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('50968847942a4cc03a60e85051cb1e8edfce099085b752bec4ca9dbaddbb6b61cea99bb0ece9574e2b4e4a75c6b1d06a790ac3d0dd9b710e223b1ef3a7e38324')
conflicts=("${pkgname}-git")

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    make
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make install PREFIX="${pkgdir}/usr"
}
