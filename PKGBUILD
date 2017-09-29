# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-amazon-cloud-player
pkgver=5.5
pkgrel=1
pkgdesc="amazon cloud player integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-amazon-cloud-player"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('79c4d2e4427d9bbd2bcd666a6c16175a560c9508f1f537229a382438c5577ac9')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
