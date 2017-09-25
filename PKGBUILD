# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-bbc-iplayer
pkgver=1.1
pkgrel=1
pkgdesc="bbc iplayer integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-bbc-iplayer"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('1a499ffa175ff10de99f46592faf6a9de0afe8f4154142f77bfdbdaf428ddfed')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
