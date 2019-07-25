# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=p7screen
pkgver=3.0
pkgrel=2
pkgdesc="Casio Communication Protocol 7.00 implementation"
arch=('i686' 'x86_64')
url="https://p7.planet-casio.com/"
license=('GPL2')
groups=()
depends=('libusb>=1.0' 'libp7>=3.0' 'sdl>=1.2.15')
makedepends=('asciidoc>=8.6.9')
optdepends=()
provides=('p7screen')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://p7.planet-casio.com/pub/p7utils-${pkgver}.tar.gz)
md5sums=('4af3e7a6e1776483f670d56fbdf9f9cb')
noextract=()

build() {
  cd "p7utils-$pkgver"
  ./configure && make all-p7screen
}

package() {
  cd "p7utils-$pkgver"
  make install-p7screen DESTDIR="$pkgdir"
}
