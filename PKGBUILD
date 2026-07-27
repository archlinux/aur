# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>
declare pkgdir
pkgname="fennel-ls"
pkgrel=1
pkgver=0.2.4
pkgdesc="Language Server for Fennel"
arch=("any")
url="https://sr.ht/~xerool/fennel-ls"
license=("MIT")
depends=("lua")
makedepends=("fennel" "make" "git" "pandoc")
source=("https://git.sr.ht/~xerool/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('68822a908cc422cb6be28e5461ff11756eb54a50bfbf951b3d1b38d9133f7d3b10629e9b6745ecc473dc03eacc58d857a80b450865901d84f3c8df7db399a7a3')
conflicts=("${pkgname}-git")

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr"
}
