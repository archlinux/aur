# shellcheck shell=bash
pkgname="fennel-ls"
pkgrel=1
pkgver=0.1.3
pkgdesc="Language Server for Fennel"
arch=("any")
url="https://sr.ht/~xerool/fennel-ls"
license=("MIT")
depends=("lua")
makedepends=("make" "git")
source=("https://git.sr.ht/~xerool/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=("983cffedb7cec3f44c20ee7d5686901189eb7beb2302bc285f9f82143fd354bf3c65645548dbd58364f3c2c57d7bef305679baa6f344f819f6c0cfd45ab0cb6d")
conflicts=("${pkgname}-git")

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr"
}
