# Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvola-app-owncloud-music
pkgver=1.3
pkgrel=1
pkgdesc="owncloud music integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-owncloud-music"
license=('custom:BSD')
depends=('nuvolaruntime' 'imagemagick')
makedepends=('nuvolasdk' 'scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('761e33db589a2f642192b256727963feb435bea25e0fa9acf4dc00f32fffe9d4')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr 
    make all
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
