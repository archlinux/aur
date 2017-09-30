# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-bandcamp
pkgver=2.2
pkgrel=1
pkgdesc="bandcamp integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-bandcamp"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('ac5cc93361f7c3ae03edbb1fb7eb804811fa54399341b8c049878936e9ff0ce5')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
