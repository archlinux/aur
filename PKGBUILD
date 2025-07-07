# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=findent
pkgver=4.3.6
pkgrel=1
pkgdesc="Indent, beautify and relabel Fortran source, generates dependencies"
arch=(i686 x86_64)
url="https://www.ratrabbit.nl/ratrabbit/${pkgname}"
license=(BSD-3-clause)
depends=(bash)
source=(https://www.ratrabbit.nl/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('8c0b6a41239b4d9eecc64d180c7daa1566cadc985c568fb4eccc69d4383d9888a7fa449511767745ff9da0007ff920d53260be1dba675c637cb6c055e5e9a143')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
