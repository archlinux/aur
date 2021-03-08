# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=xmlparsedata
_cranver=1.0.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Parse Data of 'R' Code as an 'XML' Tree"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.0.0')
optdepends=(r-covr r-testthat r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('766034ab5e9728609bd240c9954d23ca0cdb881a98a31b9d3e1c8767c7b7cbb0')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
