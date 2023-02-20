# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Erik Johnson <palehose at gmail dot com>

pkgname=libucl
pkgver=0.8.2
pkgrel=1
pkgdesc="Universal configuration library parser"
arch=('x86_64')
url="https://github.com/vstakhov/libucl"
license=('BSD')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vstakhov/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d95a0e2151cc167a0f3e51864fea4e8977a0f4c473faa805269a347f7fb4e165')

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
