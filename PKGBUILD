# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-amazon-cloud-player
pkgver=5.4
pkgrel=1
pkgdesc="amazon cloud player integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-amazon-cloud-player"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('4867590c4d12f79bc2ed3e914cc284d546fd29dbc87bf7a2a902d63332be3413')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
