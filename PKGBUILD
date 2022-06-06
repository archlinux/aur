# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IRISFGM
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Comprehensive Analysis of Gene Interactivity Networks Based on Single-Cell RNA-Seq'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-adaptgauss
  r-annotationdbi
  r-anocva
  r-clusterprofiler
  r-colorspace
  r-desingle
  r-drimpute
  r-ggplot2
  r-ggpubr
  r-ggraph
  r-igraph
  r-knitr
  r-mcl
  r-mixtools
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pheatmap
  r-polychrome
  r-rcolorbrewer
  r-rcpp
  r-scater
  r-scran
  r-seurat
  r-singlecellexperiment
)
optdepends=(
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e08495fab173360144b111f32105ab21b0ca5d92d3b40a3f64e0e1fac6ec898d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
