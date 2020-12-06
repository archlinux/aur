# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=loo
_cranver=2.4.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Efficient Leave-One-Out Cross-Validation and WAIC for Bayesian Models"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.1.2' r-checkmate 'r-matrixstats>=0.52' 'pandoc>=1.12.3' pandoc-citeproc)
optdepends=(r-bayesplot r-brms r-ggplot2 r-knitr r-rmarkdown r-rstan r-rstanarm r-rstantools r-spdep r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('4955f27dc0e44192d190214a3e6e6f85bc9c447a6af8fd3294b07beb662c4105')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
