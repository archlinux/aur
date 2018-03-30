# Maintainer: Andrew Stubbs <andrew.stubbs at gmail dot com>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-youtube
pkgver=2.0
pkgrel=1
pkgdesc="youtube integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-youtube"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('af41f4217605aab30e1d43f6c681eb590061529d3d5cc4415efd6c9bf7fcd0c3')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
