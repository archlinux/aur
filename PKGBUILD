# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=rmw
pkgver=0.7.05
pkgrel=1
pkgdesc="rmw (ReMove to Waste) is a safe-remove utility for the command line."
arch=('any')
url="https://remove-to-waste.info"
license=('GPL3')
depends=('ncurses')
optdepends=('gettext')

source=(https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('c2c30e2255745e6e8bedae14fb4d6b2ec5a407461dbf362c650e35692240681d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
