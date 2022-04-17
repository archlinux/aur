# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=biobambam
pkgver=2.0.183_release_20210802180148
pkgrel=2
pkgdesc="BAM file pre-processing utilities for bioinformatics."
arch=('x86_64')
url="https://github.com/gt1/biobambam2"
license=('GPL3')
makedepends=('libmaus' 'autoconf' 'make' 'boost')
source=(https://gitlab.com/german.tischler/biobambam2/-/archive/${pkgver//_/-}/${pkgname}2-${pkgver//_/-}.tar.gz)
sha256sums=('8712ceac509c389111b01dc3429f673dc0f8b77cb2bc48a1ebcf17f6888b2945')

build() {
  cd "${srcdir}"/"${pkgname}2"-"${pkgver//_/-}"
  autoreconf -i -f
  ./configure --prefix="${pkgdir}"/usr --with-libmaus2=${LIBMAUSPREFIX}
}

check() {
  cd "${srcdir}"/"${pkgname}2"-"${pkgver//_/-}"
  make test
}

package() {
  cd "${srcdir}"/"${pkgname}2"-"${pkgver//_/-}"
  make install
}
