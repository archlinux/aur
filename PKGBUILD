# system requirements: pandoc (>= 1.12.3, needed for vignettes)
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=bssm
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Bayesian Inference of Non-Linear and Non-Gaussian State Space Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  pandoc
  r
  r-bayesplot
  r-checkmate
  r-coda
  r-diagis
  r-dplyr
  r-posterior
  r-ramcmc
  r-rcpp
  r-rcpparmadillo
  r-rlang
  r-sitmo
  r-tidyr
)
optdepends=(
  r-covr
  r-ggplot2
  r-kfas
  r-knitr
  r-mass
  r-ramcmc
  r-rmarkdown
  r-sde
  r-sitmo
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d67b911c560e3b9da62fbe83751e8163e756500aea1579fb497cfc6245582e88')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
