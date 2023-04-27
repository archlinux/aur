# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phemd
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
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
makedepends=(
  git
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}_${_pkgver}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
