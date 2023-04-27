# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=quantiseqr
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Quantification of the Tumor Immune contexture from RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-ggplot2
  r-limsolve
  r-preprocesscore
  r-rlang
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-dplyr
  r-experimenthub
  r-geoquery
  r-knitr
  r-macrophage
  r-org.hs.eg.db
  r-reshape2
  r-rmarkdown
  r-testthat
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('54cd24049197d914523acc910d526be3e6c15bca0559040949f7b7e5eacd2ef6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
