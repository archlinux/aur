# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=rmw
pkgver=0.7.06
pkgrel=1
pkgdesc="rmw (ReMove to Waste) is a safe-remove utility for the command line."
arch=('any')
url="https://remove-to-waste.info"
license=('GPL3')
depends=('ncurses')
optdepends=('gettext')

source=(https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('56a01c6f78348829e1a9ec821c8b979fe9da0c1e1bc4032439916c164b7975e5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
