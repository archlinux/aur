# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Erik Johnson <palehose at gmail dot com>

pkgname=libucl
pkgver=0.9.2
pkgrel=1
pkgdesc="Universal configuration library parser"
arch=('x86_64')
url="https://github.com/vstakhov/libucl"
license=('BSD-2-Clause')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vstakhov/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f63ddee1d7f5217cac4f9cdf72b9c5e8fe43cfe5725db13f1414b0d8a369bbe0')

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
