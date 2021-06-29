# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=rmw
pkgver=0.8.0
pkgrel=1
pkgdesc="rmw (ReMove to Waste) is a safe-remove utility for the command line."
arch=('any')
url="https://remove-to-waste.info"
license=('GPL3')
depends=('ncurses')
makedepends=('meson' 'ninja' 'valgrind')
optdepends=('gettext')

#source=(https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
source=(https://github.com/theimpossibleastronaut/rmw/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('17b11b771befb89adbd7764fb897dff1a32eed34f8cd4d8b495da7f2a66de3b8')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
