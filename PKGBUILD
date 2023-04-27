# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowAI
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Automatic and interactive quality control for flow cytometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-changepoint
  r-flowcore
  r-ggplot2
  r-knitr
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-rmarkdown
  r-scales
)
optdepends=(
  r-biocstyle
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('af884f980a02aff7edbc49554028939824f567029bd6edcc02fce2a8314abe79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
