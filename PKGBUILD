# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-mixcloud
pkgver=4.1
pkgrel=1
pkgdesc="mixcloud integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-mixcloud"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('a2bcf0fc83f7847160d277065130aa20be836bb36d43ed7102b263e8f1afd70d')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
