# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=1.0
pkgrel=2
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/freeassociation/'
license=('LGPL' 'MPL')
depends=('glibc')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/freeassociation/${pkgname}-${pkgver}.tar.gz")
md5sums=('4438c31d00ec434f02867a267a92f8a1')

build() {
  mkdir -p build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
