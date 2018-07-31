# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-google-play-music
pkgver=6.1
pkgrel=1
pkgdesc="Google Play integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-google-play-music"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('48fa00654f8a43f3658ac177572e941eb8f8f406ebded845342693e6b052a389')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
