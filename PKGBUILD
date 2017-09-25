# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-groove
pkgver=2.0
pkgrel=1
pkgdesc="groove integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-groove"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e72f8983ad7eaabe191cd7d1a750bdb00809c7af6c3c2299eb9a386ee9d21c79')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
