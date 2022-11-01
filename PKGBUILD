# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Seurat
_pkgver=4.2.0
pkgname=r-${_pkgname,,}
pkgver=4.2.0
pkgrel=1
pkgdesc='Tools for Single Cell Genomics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cowplot
  r-fitdistrplus
  r-future
  r-future.apply
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-httr
  r-ica
  r-igraph
  r-irlba
  r-jsonlite
  r-leiden
  r-lmtest
  r-matrixstats
  r-miniui
  r-patchwork
  r-pbapply
  r-plotly
  r-png
  r-rann
  r-rcolorbrewer
  r-rcpp
  r-rcppannoy
  r-rcppeigen
  r-rcppprogress
  r-reticulate
  r-rlang
  r-rocr
  r-rtsne
  r-scales
  r-scattermore
  r-sctransform
  r-seuratobject
  r-shiny
  r-spatstat.core
  r-spatstat.geom
  r-tibble
  r-uwot
)
optdepends=(
  r-ape
  r-biobase
  r-biocgenerics
  r-deseq2
  r-enrichr
  r-genomeinfodb
  r-genomicranges
  r-ggrastr
  r-hdf5r
  r-iranges
  r-limma
  r-mast
  r-metap
  r-mixtools
  r-monocle
  r-rfast2
  r-rsvd
  r-rtracklayer
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('22a3d22a9ba255c4db5b37339b183fdfb91e2d37a8b8d58a9ff45b1bc414ebef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
