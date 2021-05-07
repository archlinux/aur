# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=rmw
pkgver=0.7.09
pkgrel=1
pkgdesc="rmw (ReMove to Waste) is a safe-remove utility for the command line."
arch=('any')
url="https://remove-to-waste.info"
license=('GPL3')
depends=('ncurses')
optdepends=('gettext')

source=(https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('d0a85944d03e7ec2a94b25d6d6ac92880fd0d3f63d90bb9ed56b16418fd41c69')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
