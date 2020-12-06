# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=inline
_cranver=0.3.17
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
sha256sums=('792857b2ebd408d6523424d2f6bb7297e241d4b28ab32372f6a9240c8cd554f3')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
