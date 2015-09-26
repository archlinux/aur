# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Dennis Gosnell <cdep.illabout@gmail.com>
pkgname=wmacpi
pkgver=2.3
pkgrel=3
pkgdesc="Battery monitor dockapp for Window Maker that doesn't depend on HAL"
arch=('i686' 'x86_64')
url="http://himi.org/wmacpi/"
license=('GPL')
depends=(libdockapp)
source=("${pkgname}-${pkgver}.tar.gz::http://windowmaker.org/dockapps/?download=${pkgname}-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd dockapps-*
  # make sure we don't build the command line `acpi` tool
  sed -i 's/^BUILD_CLI = 1$/#BUILD_CLI = 1/' Makefile
  make
}

package() {
  cd dockapps-*
  make install PREFIX="$pkgdir/usr/"
}
