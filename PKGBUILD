# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=evaluomeR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Evaluation of Bioinformatics Metrics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-corrplot
  r-flexmix
  r-fpc
  r-ggdendro
  r-ggplot2
  r-kableextra
  r-matrixstats
  r-mclust
  r-multiassayexperiment
  r-plotrix
  r-prabclus
  r-randomforest
  r-rdpack
  r-reshape2
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magrittr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('385749c22114ebdb5c30e61630163942693ed6600c24bbc106365ffcb9a85572')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
