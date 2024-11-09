# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmGamPoi
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Fit a Gamma-Poisson Generalized Linear Model'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beachmat
  r-biocgenerics
  r-delayedarray
  r-delayedmatrixstats
  r-hdf5array
  r-matrixgenerics
  r-matrixstats
  r-rcpp
  r-rcpparmadillo
  r-rlang
  r-singlecellexperiment
  r-summarizedexperiment
  r-vctrs
)
optdepends=(
  r-beachmat
  r-bench
  r-biocparallel
  r-biocstyle
  r-deseq2
  r-dplyr
  r-edger
  r-ggplot2
  r-knitr
  r-limma
  r-mass
  r-matrix
  r-muscdata
  r-rmarkdown
  r-scran
  r-statmod
  r-tenxpbmcdata
  r-testthat
  r-zoo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36f57f991824f95e91c6a91423fc20b5f6f32cbbc7ab15e6b50534fa16cd2d90')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
