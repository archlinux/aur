# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=rmw
pkgver=0.7.07
pkgrel=1
pkgdesc="rmw (ReMove to Waste) is a safe-remove utility for the command line."
arch=('any')
url="https://remove-to-waste.info"
license=('GPL3')
depends=('ncurses')
optdepends=('gettext')

source=(https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f29f00d200d2fda86c58164230baa86559a3de9299d35617c0b37a4dddbadd32')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
