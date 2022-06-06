# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAGeCKFlute
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=2.0.0
pkgrel=1
pkgdesc='Integrative Analysis Pipeline for Pooled CRISPR Functional Genetic Screens'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-clusterprofiler
  r-enrichplot
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-reshape2
  r-msigdbr
  r-pathview
  r-depmap
)
optdepends=(
  r-biocstyle
  r-biomart
  r-dendextend
  r-dose
  r-graphics
  r-knitr
  r-pheatmap
  r-png
  r-scales
  r-sva
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5580217e7f29318ad4b8acddcb5cda450a0e9b7302e6a3f75686d782ca3d8e6d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
