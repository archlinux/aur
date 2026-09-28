# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=findent
pkgver=4.4.0
pkgrel=1
pkgdesc="Indent, beautify and relabel Fortran source, generates dependencies"
arch=(i686 x86_64)
url="https://www.ratrabbit.nl/ratrabbit/${pkgname}"
license=(BSD-3-clause)
depends=(bash)
source=(https://www.ratrabbit.nl/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('daf82623419f4a74e0ee22afbfb0ff5ac1c108bc174dc3350be9c6dcfd10fc4d5269718e5a66a459d038a66e9407de128cbc4ec7bf7f449d3e35f6beed3ddc50')

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
