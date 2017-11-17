# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-siriusxm
pkgver=1.4
pkgrel=1
pkgdesc="siriusxm integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-siriusxm"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('678e248ac44a7513bd009d32695703332e09e03ce799658f1f4bd88269f3a0ac')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
