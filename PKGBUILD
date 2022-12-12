# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=biobambam
pkgver=2.0.185_release_20221211202123
pkgrel=1
pkgdesc="BAM file pre-processing utilities for bioinformatics."
arch=('x86_64')
url="https://github.com/gt1/biobambam2"
license=('GPL3')
makedepends=('libmaus' 'autoconf' 'make' 'boost')
source=(https://gitlab.com/german.tischler/biobambam2/-/archive/${pkgver//_/-}/${pkgname}2-${pkgver//_/-}.tar.gz)
sha256sums=('e405421e869ac7220c3a7e5da0d24a3c7b4c7b1807e044a439fe68efc88a1f2a')

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
