# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-kexp
pkgver=1.2
pkgrel=1
pkgdesc="kexp integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-kexp"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('b3c2377427cecb8dd599acf354f6caff01e6463329568f2d209b512613e34720')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
