# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-pocket-casts
pkgver=1.0
pkgrel=1
pkgdesc="pocket casts integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-pocket-casts"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('08a034819dc68f90e456ae901cee112de019e9d8f86cfa75dab2ec034ad5fd34')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
