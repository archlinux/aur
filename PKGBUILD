# Maintainer: Pavel Antonov <pvantonov@gmail.com>

pkgname=nuvola-app-logitech-media-server
pkgver=2.2
pkgrel=1
pkgdesc="Logitech Media Server integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-logitech-media-server"
license=('custom:BSD')
depends=('nuvolaruntime')
makedepends=('scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('f630593b40f84b107bfda4c41df82734fec9ec487cf54336741150a5894ef619')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
