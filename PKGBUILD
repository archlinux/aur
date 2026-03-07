# Maintainer: shadwoash8 <shadowash8 at protonmail dot com>
# Contributor: Nitin Bhat <nitinbhat972@gmail.com>

pkgname=cwal16
_pkgname=cwal

pkgver=1.0.0
pkgrel=1
pkgdesc="Blazing-fast pywal-like color palette generator written in C, fork of cwal with extra features."
arch=('x86_64')
url="https://github.com/shadowash8/cwal16"
license=('GPL3')
depends=('imagemagick' 'libimagequant' 'lua')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
    cmake -B build
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
    DESTDIR="${pkgdir}" cmake --install build
}
