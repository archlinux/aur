# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Dennis Gosnell <cdep.illabout@gmail.com>
pkgname=wmacpi
pkgver=2.3
pkgrel=2
pkgdesc="Battery monitor dockapp for Window Maker that doesn't depend on HAL"
arch=('i686' 'x86_64')
url="http://himi.org/wmacpi/"
license=('GPL')
depends=(libdockapp)
source=("http://windowmaker.org/dockapps/?download=${pkgname}-${pkgver}.tar.gz")
md5sums=('720bb30d777ec089c029fd79eb4b71e5')

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
