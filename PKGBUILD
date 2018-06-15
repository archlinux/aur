# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-pocket-casts
pkgver=1.1
pkgrel=1
pkgdesc="pocket casts integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-pocket-casts"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('39b645c4d6ea5fc9f4b048904d003e4442aba87c6fffcec47267b52ba5e38321')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
