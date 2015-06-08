# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Helmut Henig <Helmut.Henig@gmx.at>

pkgname=aften
pkgver=0.0.8
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Audio encoder which generates compressed audio streams based on ATSC A/52 specification."
url="http://aften.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/aften/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('1ff73cdcade0624495ad807492cecf14862fb61c')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSHARED=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
