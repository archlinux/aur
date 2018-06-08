# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-soundcloud
pkgver=1.4
pkgrel=1
pkgdesc="soundcloud integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-soundcloud"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('18af3c082b0f6fd24ed25c3a6a9c09722a46c79338c82fcf9b6a8bc53a31d5fc')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
