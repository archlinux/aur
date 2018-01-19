# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-mixcloud
pkgver=4.0
pkgrel=1
pkgdesc="mixcloud integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-mixcloud"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('b33c4f3b2db872b529c1b93638dd573ba31d40884a426dd4407b15c32074bddf')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
