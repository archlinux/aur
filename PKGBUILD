# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-deezer
pkgver=2.7
pkgrel=1
pkgdesc="deezer integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-deezer"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('b8a9c408465c95d16eb3a3512e65eee3e4660a6a87ac7d2737d6d4ed02ec4e04')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
