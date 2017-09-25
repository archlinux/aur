# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-jupiter-broadcasting
pkgver=1.1
pkgrel=1
pkgdesc="Jupiter broadcasting integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-jupiter-broadcasting"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('657d9ecfca342148eec7f95d788ca7d78109eefcb8e0d3d62fe39fc17b79518f')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
