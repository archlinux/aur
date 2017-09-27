# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-yandex-music
pkgver=1.4
pkgrel=1
pkgdesc="yandex music integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-yandex-music"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e4892239bde484df7077dd5f8cfca4db520da8068ecf7091d31c2e2964f95958')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
