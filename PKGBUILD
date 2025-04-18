# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetNet
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Inferring metabolic networks from untargeted high-resolution mass spectrometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-bnlearn
  r-corpcor
  r-dplyr
  r-genenet
  r-genie3
  r-ggplot2
  r-parmigene
  r-psych
  r-rlang
  r-s4vectors
  r-stabs
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-glmnet
  r-igraph
  r-knitr
  r-mscoreutils
  r-rmarkdown
  r-spectra
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('092189cd9b200563368752b0f1af0b0685afd8d64aa9ec7aaac8f0ae418a6118')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
