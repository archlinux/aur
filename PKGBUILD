# shellcheck shell=bash
pkgname="fennel-ls"
pkgrel=1
pkgver=0.1.2
pkgdesc="Language Server for Fennel"
arch=("any")
url="https://sr.ht/~xerool/fennel-ls"
license=("MIT")
depends=("lua")
makedepends=("make" "git")
source=("https://git.sr.ht/~xerool/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=("3401b76f230868d43c0d48e53b0f91eb6858dd2adb750c64c4190f3f8d01d3ea53ae6da2af2d7469e096e23534bbba308c945a2d2c8a812f03670291d479a577")
conflicts=("${pkgname}-git")

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr"
}
