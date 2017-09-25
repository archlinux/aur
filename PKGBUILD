# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-mixcloud
pkgver=3.2
pkgrel=1
pkgdesc="mixcloud integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-mixcloud"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('287b13d89fb453ed27cbf45cfa3ae1eb7db781339245126fc533ccc2ef867420')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
