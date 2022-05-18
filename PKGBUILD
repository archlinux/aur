# Maintainer: A.T.W.A. <arch.atwa@gmail.com>

pkgname=libucl
pkgver=0.8.1
pkgrel=1
pkgdesc="Universal configuration library parser"
arch=('x86_64')
url="https://github.com/vstakhov/libucl"
license=('BSD')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vstakhov/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a6397e179672f0e8171a0f9a2cfc37e01432b357fd748b13f4394436689d24ef')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
