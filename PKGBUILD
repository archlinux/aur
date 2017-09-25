# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-8tracks
pkgver=5.2
pkgrel=1
pkgdesc="8tracks integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-8tracks"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('1067a00ef4743b231d8465a1fb0aee04')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
