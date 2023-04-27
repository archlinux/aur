# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scDataviz
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='scDataviz: single cell dataviz and downstream analyses'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-corrplot
  r-flowcore
  r-ggplot2
  r-ggrepel
  r-matrixstats
  r-rcolorbrewer
  r-reshape2
  r-s4vectors
  r-scales
  r-seurat
  r-singlecellexperiment
  r-umap
)
optdepends=(
  r-biocgenerics
  r-cowplot
  r-kableextra
  r-knitr
  r-pcatools
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a7f473a8cf1e34ef3cfc5523d5324421a2d3a26e2c1bea3b4d947364bf15696b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
