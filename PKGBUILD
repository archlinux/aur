# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-google-calendar
pkgver=1.3
pkgrel=1
pkgdesc="google calendar integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-google-calendar"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('ad6dafb2367b652ee2ef084cd752e5389ed46cef42f268d5c73f9427f7e12ef2')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
