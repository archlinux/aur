# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Foppe HEMMINGA <foppe@hemminga.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=dds
pkgver=2.9.0
pkgrel=1
pkgdesc="A bridge double dummy solver"
arch=('i686' 'x86_64')
url="https://privat.bahnhof.se/wb758135/"
license=('Apache')
options=('staticlibs')
makedepends=('boost')
source=(https://github.com/dds-bridge/dds/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('9ef36d8c36bf697ba3b499fcb9dca51a4b423278ac72e947235ac86f0b5fc38a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  cp Makefiles/Makefile_linux_static Makefile
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  install -Dm644 dds.h "${pkgdir}/usr/include/dds.h"
  install -Dm644 libdds.a "${pkgdir}/usr/lib/libdds.a"
}
