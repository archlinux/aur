# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-bbc-iplayer
pkgver=1.2
pkgrel=1
pkgdesc="bbc iplayer integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-bbc-iplayer"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('bd9ab24ad1f3cbd9e4bd258dc03a8a4ae98e7edc78d9c32c74b63a17d111a634')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
