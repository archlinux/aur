# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scater
_pkgver=1.30.1
pkgname=r-${_pkgname,,}
pkgver=1.30.1
pkgrel=1
pkgdesc='Single-Cell Analysis Toolkit for Gene Expression Data in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beachmat
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-ggbeeswarm
  r-ggplot2
  r-ggrastr
  r-ggrepel
  r-matrixgenerics
  r-pheatmap
  r-rcolorbrewer
  r-rcppml
  r-rlang
  r-rtsne
  r-s4vectors
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-uwot
  r-viridis
)
optdepends=(
  r-biobase
  r-biocstyle
  r-biomart
  r-cowplot
  r-densvis
  r-knitr
  r-rmarkdown
  r-robustbase
  r-scattermore
  r-scrnaseq
  r-snifter
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9db9bcb20f00f07de2d8b31af85a07302f4778002447036a1924d6a77bb74419')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
