# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CEMiTool
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Co-expression Modules identification Tool'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-clusterprofiler
  r-data.table
  r-dplyr
  r-dt
  r-fastcluster
  r-fgsea
  r-ggdendro
  r-ggplot2
  r-ggpmisc
  r-ggrepel
  r-ggthemes
  r-gridextra
  r-gtable
  r-htmltools
  r-igraph
  r-intergraph
  r-knitr
  r-matrixstats
  r-network
  r-pracma
  r-rmarkdown
  r-scales
  r-sna
  r-stringr
  r-wgcna
)
optdepends=(
  r-biocmanager
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e237e8b6f31eb3f43495b4b07c8277ef8a8405c11e3135a29e21cbb2bedb0b89')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
