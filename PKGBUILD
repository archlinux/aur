# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-bbc-iplayer
pkgver=1.5
pkgrel=1
pkgdesc="bbc iplayer integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-bbc-iplayer"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('07758fa010ab6c3bc6ecb87bbe04e04e8f9edeba604fc52fc4d9f73a1e4d0d14')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
