# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ivygapSE
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='A SummarizedExperiment for Ivy-GAP data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-hwriter
  r-plotly
  r-s4vectors
  r-shiny
  r-summarizedexperiment
  r-survminer
  r-upsetr
)
optdepends=(
  r-biocstyle
  r-codetools
  r-digest
  r-dt
  r-grid
  r-knitr
  r-limma
  r-magick
  r-png
  r-randomforest
  r-rmarkdown
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2dd30a51c4a0189a4e44d07cdb096fae9471fcf6cc563205434e21d9b6d23e7f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
