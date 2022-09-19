# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=biobambam
pkgver=2.0.184_release_20220919134840
pkgrel=1
pkgdesc="BAM file pre-processing utilities for bioinformatics."
arch=('x86_64')
url="https://github.com/gt1/biobambam2"
license=('GPL3')
makedepends=('libmaus' 'autoconf' 'make' 'boost')
source=(https://gitlab.com/german.tischler/biobambam2/-/archive/${pkgver//_/-}/${pkgname}2-${pkgver//_/-}.tar.gz)
sha256sums=('e64a2eb261ff8af270ba541e67793a93c440c3691eee6aa40beae97ba68578c0')

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
