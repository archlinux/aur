# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=rmw
pkgver=0.7.04
pkgrel=1
pkgdesc="rmw (ReMove to Waste) is a safe-remove utility for the command line."
arch=('any')
url="https://remove-to-waste.info"
license=('GPL3')
depends=('ncurses')
optdepends=('gettext')

source=(https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('078bcffead7cc82564460bb8cfe22c3e36a63ecf58e8b563235989e173b06f74')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
