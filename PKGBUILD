# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-tunein
pkgver=1.3
pkgrel=1
pkgdesc="tunein integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-tunein"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('3442a633e539bf569c5197bbee817bd4b4d847919c4e3a0ec33cb2cf40764bb1')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
