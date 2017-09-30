# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-soundcloud
pkgver=1.3
pkgrel=1
pkgdesc="soundcloud integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-soundcloud"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('bf6cd6c9bdd9232f15cf3f3c07ef6c1ab8a1b7418087b36bd774fdf9a207b63b')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
