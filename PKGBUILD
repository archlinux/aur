# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-jupiter-broadcasting
pkgver=1.2
pkgrel=1
pkgdesc="Jupiter broadcasting integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-jupiter-broadcasting"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('710dbec77affc6eb93fdc1056d5ce507bf3e8476dcad47f6e6d54add29470667')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
