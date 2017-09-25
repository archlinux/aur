# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-jango
pkgver=2.3
pkgrel=1
pkgdesc="jango integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-jango"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e8c6acd7461956f16dde284e111d97a95759c0f2b69d07fe753cf0bb965e64cd')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
