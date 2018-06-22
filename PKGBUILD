# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-kexp
pkgver=1.3
pkgrel=1
pkgdesc="kexp integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-kexp"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('bb5ec272817378251710c2cc9125eee924abca2694727635108338a61c9829d6')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
