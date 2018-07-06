# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-jango
pkgver=2.4
pkgrel=1
pkgdesc="jango integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-jango"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('8f0f8455819e5086f5bbb3bf67d81ed5c90105dd6c5674d57108f786248ae5d2')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
