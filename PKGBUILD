# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CHETAH
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
pkgrel=2
pkgdesc='Fast and accurate scRNA-seq cell type identification'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biodist
  r-corrplot
  r-cowplot
  r-dendextend
  r-ggplot2
  r-gplots
  r-pheatmap
  r-plotly
  r-reshape2
  r-s4vectors
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-matrix
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('431eb0d188319f5bc928db0eb76c80873420f3e61d652648820ebe3cef47dfd9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
