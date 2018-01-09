# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-google-play-music
pkgver=6.0
pkgrel=1
pkgdesc="Google Play integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-google-play-music"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('dfa272e268e682bc6d7816d9dfd89f5672a3d59df66e2ab52023487628e04e5e')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
