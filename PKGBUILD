# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=findent
pkgver=4.2.6
pkgrel=1
pkgdesc="Indent, beautify and relabel Fortran source, generates dependencies"
arch=(i686 x86_64)
url="https://www.ratrabbit.nl/ratrabbit/${pkgname}"
license=('custom:BSD-3-clause')
depends=(bash)
source=(https://www.ratrabbit.nl/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1d97005a6f414a1876dd2140922125b7e399fc7b03afaea0b2fe6dfd7eb6baeb3bf16d3ae7b259e3c9a613a889f2759393c1ed5f98e5bda8ee6ea3ddd5e713c0')

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
