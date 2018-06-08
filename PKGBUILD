# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-8tracks
pkgver=5.3
pkgrel=1
pkgdesc="8tracks integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-8tracks"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('35b29af5a86e31e336e24c75ea5b7efd')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
