# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-plex
pkgver=1.3
pkgrel=1
pkgdesc="plex integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-plex"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('940e6d769627b56e2747d1b7d9f125811b72f8189acaad2eadacf49a52ba204f')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
