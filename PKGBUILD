# Maintainer: Andrew Stubbs <andrew.stubbs at gmail dot com>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-youtube
pkgver=1.3
pkgrel=1
pkgdesc="youtube integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-youtube"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('4b6819e2f888b1b2e45e3dee2401c5dad69015a77b3c9d9b68be1b044f200422')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
