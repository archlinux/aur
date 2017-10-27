# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-bbc-iplayer
pkgver=1.3
pkgrel=1
pkgdesc="bbc iplayer integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-bbc-iplayer"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('ef5af9e240e3210d10fc4a411c906dea498b90e6d0f6cbe58db69b4d20ea209a')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
