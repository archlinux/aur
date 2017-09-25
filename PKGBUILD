# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-owncloud-music
pkgver=1.2
pkgrel=1
pkgdesc="owncloud music integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-owncloud-music"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('c1cd683bac1ab9a751a5b22424daad41ec445af884125179d300fedba7622402')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
