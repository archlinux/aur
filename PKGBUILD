# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scone
_pkgver=1.32.1
pkgname=r-${_pkgname,,}
pkgver=1.32.1
pkgrel=1
pkgdesc='Single Cell Overview of Normalized Expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aroma.light
  r-biocparallel
  r-compositions
  r-diptest
  r-edger
  r-fpc
  r-gplots
  r-hexbin
  r-limma
  r-matrixgenerics
  r-matrixstats
  r-mixtools
  r-rarpack
  r-rcolorbrewer
  r-rhdf5
  r-ruvseq
  r-singlecellexperiment
  r-summarizedexperiment
  r-delayedmatrixstats
  r-sparsematrixstats
)
optdepends=(
  r-batchtools
  r-biocstyle
  r-doparallel
  r-dt
  r-ggplot2
  r-kableextra
  r-knitr
  r-mclust
  r-miniui
  r-nmf
  r-plotly
  r-reshape2
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-shiny
  r-splatter
  r-tenxpbmcdata
  r-testthat
  r-visnetwork
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('06bc23002c1b6eefaea9367a098e8ba33ce578b41f65c6f3e8e1efcbac8fca0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
