# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=p7screen
pkgver=2.0
pkgrel=2
pkgdesc="Casio Communication Protocol 7.00 implementation"
arch=('i686' 'x86_64')
url="https://p7.touhey.fr/"
license=('GPL2')
groups=()
depends=('libusb>=1.0' 'libp7>=2.0')
makedepends=('make>=4.0' 'gcc>=4.9' 'asciidoc>=8.6.9' 'gzip>=1.6' 'binutils>=2.25')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://p7.touhey.fr/pub/p7utils-${pkgver}.tar.gz)
noextract=()
md5sums=('66d2407ee3c7f9b79bc11e7b6cd2a726')

build() {
  cd "p7utils-$pkgver"
  ./configure && make all-p7screen
}

package() {
  cd "p7utils-$pkgver"
  make install-p7screen DESTDIR="$pkgdir"
}
