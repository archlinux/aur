# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetNet
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Inferring metabolic networks from untargeted high-resolution mass spectrometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-bnlearn
  r-dplyr
  r-genie3
  r-ggplot2
  r-mpmi
  r-parmigene
  r-ppcor
  r-psych
  r-rlang
  r-s4vectors
  r-stabs
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-genenet
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-glmnet
  r-igraph
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('13f0bf79d54faed2d8bda8303749fc11f452d8386eaf77f8b4a5e86eea247507')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
