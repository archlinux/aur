# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-bandcamp
pkgver=2.3
pkgrel=1
pkgdesc="bandcamp integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-bandcamp"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('35b3520d7801bfc6e0a35fce7fa4ec7385a74af396a31bd201e60e080e975bba')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
