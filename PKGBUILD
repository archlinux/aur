# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phemd
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=2
pkgdesc='Phenotypic EMD for comparison of single-cell samples'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-cowplot
  r-destiny
  r-ggplot2
  r-igraph
  r-maptree
  r-monocle
  r-phater
  r-pheatmap
  r-pracma
  r-rann
  r-rcolorbrewer
  r-reticulate
  r-rtsne
  r-s4vectors
  r-scatterplot3d
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-transport
  r-vgam
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5cfd9efc5bbfcf3629e4c0c7cfe7fd265340d55bf54c2e36bf0098d113df7dd8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
