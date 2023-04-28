# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fcoex
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=1
pkgdesc='FCBF-based Co-Expression Networks for Single Cells'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-clusterprofiler
  r-data.table
  r-dplyr
  r-fcbf
  r-ggplot2
  r-ggrepel
  r-igraph
  r-intergraph
  r-network
  r-pathwaypca
  r-progress
  r-scales
  r-singlecellexperiment
  r-sna
  r-stringr
)
optdepends=(
  r-biocmanager
  r-devtools
  r-gridextra
  r-knitr
  r-rmarkdown
  r-scater
  r-schex
  r-scran
  r-seurat
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cc6b3a1ae15b87b94cfc765273daefbbeb89021a7b96f903384266ac8b2eb920')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
