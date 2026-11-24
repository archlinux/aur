# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CEMiTool
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=1.36.1
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
sha256sums=('c30445d9294cf2806a9ba3ca0285cfac7f7f6c6d584f8e2e354c805eaf38a2f3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
