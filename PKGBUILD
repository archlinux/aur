# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dittoSeq
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=1.14.1
pkgrel=1
pkgdesc='User Friendly Single-Cell and Bulk RNA Sequencing Visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-colorspace
  r-cowplot
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-gridextra
  r-pheatmap
  r-reshape2
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-bluster
  r-complexheatmap
  r-deseq2
  r-edger
  r-ggplot.multistats
  r-ggrastr
  r-knitr
  r-plotly
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d99826f66590a89f98dc9185e43aa374b4d9ca12c4743b4e8fcf1a13403609ec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
