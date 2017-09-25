# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-siriusxm
pkgver=1.3
pkgrel=1
pkgdesc="siriusxm integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-siriusxm"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('d7e09f8e526b38652b21d98280c66a18ae1e766ccf42b28b2811b2513f42dae8')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
