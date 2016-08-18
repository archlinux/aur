# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Dennis Gosnell <cdep.illabout@gmail.com>
pkgname=wmacpi
pkgver=2.3
pkgrel=4
pkgdesc="Battery monitor dockapp for Window Maker that doesn't depend on HAL"
arch=('i686' 'x86_64')
url="http://www.docapps.net/wmacpi"
license=('GPL')
depends=('libdockapp')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('15d4f559d6281f3eedb4bf7b59a6af0e')

build() {
  cd dockapps
  # make sure we don't build the command line `acpi` tool
  sed -i 's/^BUILD_CLI = 1$/#BUILD_CLI = 1/' Makefile
  make
}

package() {
  cd dockapps
  make install PREFIX="$pkgdir/usr/"
}
