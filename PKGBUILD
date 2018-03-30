# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-bbc-iplayer
pkgver=1.4
pkgrel=1
pkgdesc="bbc iplayer integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-bbc-iplayer"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('9614e0d566150037af269c5abae3b9a09d40d84b3bd372c3464054cb4181d977')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
