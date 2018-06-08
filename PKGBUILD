# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-siriusxm
pkgver=1.5
pkgrel=1
pkgdesc="siriusxm integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-siriusxm"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('ceb43a178fa58c3aef83a31c5a57f16bf55a378f76326baae2167d3e531c16aa')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
