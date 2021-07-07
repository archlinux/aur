# Maintainer: Andy Alt <andy400-dev at yahoo dot com>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=rmw
pkgver=0.8.0
pkgrel=2
pkgdesc="safe-remove utility for the command line"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="https://remove-to-waste.info"
license=('GPL3')
depends=('ncurses')
makedepends=('meson' 'ninja')
checkdepends=('valgrind')
optdepends=('gettext')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/theimpossibleastronaut/rmw/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a3bf20c29b4601b7f0122aa75cccc6887a5187329aff3138936d74c798e219ef')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
