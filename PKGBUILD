# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-plex
pkgver=1.4
pkgrel=1
pkgdesc="plex integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-plex"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('15af743d216a9021a1e37980f7994a0820d47a9d0312d1a8d23854875f1894c9')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
