# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CytoTree
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=4
pkgdesc='A Toolkit for Flow And Mass Cytometry Data'
arch=('x86_64')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocneighbors
  r-destiny
  r-flowcore
  r-flowsom
  r-flowutils
  r-ggplot2
  r-gmodels
  r-igraph
  r-limma
  r-matrixstats
  r-mclust
  r-pheatmap
  r-prettydoc
  r-rann
  r-rcpp
  r-rtsne
  r-scatterpie
  r-scatterplot3d
  r-stringr
  r-sva
  r-umap
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a8cd66a10de1468d24e620c25d523e643a8508f8db68070ab7cf8e3625874db7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
