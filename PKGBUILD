# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-google-calendar
pkgver=1.2
pkgrel=1
pkgdesc="google calendar integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-google-calendar"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('d637522c312e94d14963f4bec1e28ea1f8c6e0100fc2e3d0fe06c27006582a03')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
