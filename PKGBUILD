# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=inline
_cranver=0.3.18
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functions to Inline C, C++, Fortran Function Calls from R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL2 LGPL2.1 LGPL3)
depends=('r>=2.4.0')
optdepends=(r-rcpp r-tinytest)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('cc89d8c1c0355ab037193eded3a8a4231383b5d8b83dc0f084343c071777ec3a')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
