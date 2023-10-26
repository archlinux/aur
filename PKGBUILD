# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowAI
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('7ffe8ec5e2736ad644cc24174b6350a5bd9f382086ea70a2a2c78883911b21ae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
