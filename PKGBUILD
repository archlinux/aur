# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-tunein
pkgver=1.4
pkgrel=1
pkgdesc="tunein integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-tunein"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('3b08f358be822caef89d29b4d83da94a953ef86f3b7bf88bd2e908e3198eaa95')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
