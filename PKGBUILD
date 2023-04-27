# system requirements: pandoc (>= 1.19.2.1)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=abseqR
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Reporting and data analysis functionalities for Rep-Seq datasets of antibody libraries'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biocstyle
  r-circlize
  r-flexdashboard
  r-ggcorrplot
  r-ggdendro
  r-ggplot2
  r-gridextra
  r-knitr
  r-plotly
  r-plyr
  r-png
  r-rcolorbrewer
  r-reshape2
  r-rmarkdown
  r-stringr
  r-vegan
  r-venndiagram
  pandoc
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2c95679c6b0e8ed83a3821f3bbddb5962b1e570047a0786dcb34953676e56c16')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
