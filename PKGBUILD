# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-amazon-cloud-player
pkgver=5.6
pkgrel=1
pkgdesc="amazon cloud player integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-amazon-cloud-player"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('ddaa5ecf5f8cfb398ac62b2ce79a1110b16fc9cbdbdb3c9eaf1458a101d09ebe')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
