# Maintainer: Foppe HEMMINGA <foppe@hemminga.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=dds
pkgver=2.7.0
pkgrel=1
pkgdesc="A bridge double dummy solver"
arch=('i686' 'x86_64')
url="http://privat.bahnhof.se/wb758135/"
license=('Apache')
options=('staticlibs')
source=(http://privat.bahnhof.se/wb758135/${pkgname}${pkgver//.}-src.zip)
md5sums=('f85ab1086bd5ddb8386e97bf0ed6d239')

build() {
  cd "${srcdir}"
  cp dll.h dds.h
  gcc ${CFLAGS} -c dds.cpp -o dds.o
  ar rc libdds.a dds.o
  ranlib libdds.a
}

package() {
  cd "${srcdir}"
  install -Dm644 dds.h "${pkgdir}/usr/include/dds.h"
  install -Dm644 libdds.a "${pkgdir}/usr/lib/libdds.a"
}
