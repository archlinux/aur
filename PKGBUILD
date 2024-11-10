# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scTGIF
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Cell type annotation for unannotated single-cell RNA-Seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocstyle
  r-ggplot2
  r-gseabase
  r-igraph
  r-knitr
  r-msigdbr
  r-nntensor
  r-plotly
  r-rcolorbrewer
  r-rcpp
  r-rmarkdown
  r-s4vectors
  r-scales
  r-schex
  r-singlecellexperiment
  r-summarizedexperiment
  r-tagcloud
  r-tibble
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e7ccdcce146b3c92cbf21bb3e9c535318109fd0d5ba2e8bca47d34b8de18798a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
