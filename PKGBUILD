# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IRISFGM
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
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
sha256sums=('2c3faa6b4590b0af1ff32889c59e3a4f113a3d1c43d14922ce2db37485d916b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
