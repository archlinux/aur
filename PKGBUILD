# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OncoSimulR
_pkgver=4.6.0
pkgname=r-${_pkgname,,}
pkgver=4.6.0
pkgrel=1
pkgdesc='Forward Genetic Simulation of Cancer Progression with Epistasis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-data.table
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-graph
  r-gtools
  r-igraph
  r-rcolorbrewer
  r-rcpp
  r-rgraphviz
  r-smatr
  r-stringr
)
optdepends=(
  r-biocstyle
  r-bookdown
  r-knitr
  r-oncotree
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('790c6b155fbea833639cab5ca2a9d2ce3ee0507f6add2982e5115245a53aedc8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
