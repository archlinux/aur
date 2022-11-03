# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ivygapSE
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
  r-digest
  r-dt
  r-grid
  r-knitr
  r-limma
  r-png
  r-randomforest
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0fd52f4ff5f40efd5cf27a35b28d41e906a6a08e823fd891ae57b6816292bd2b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
