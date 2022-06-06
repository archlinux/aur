# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fcoex
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
sha256sums=('d518f6489d0a07079dea68e94a96c2e66355f0aee736fb97bb8417168eeb7d66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
