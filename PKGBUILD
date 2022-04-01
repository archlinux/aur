# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: 2ion

pkgname=advancecomp
pkgver=2.1
pkgrel=3
arch=('x86_64')
pkgdesc="Recompression utilities for .zip .png .mng and .gz files using the 7-zip algorithm"
url='https://www.advancemame.it/'
license=('GPL')
source=("https://github.com/amadvance/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3ac0875e86a8517011976f04107186d5c60d434954078bc502ee731480933eb8')

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man
    make
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
