# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OncoSimulR
_pkgver=3.4.0
pkgname=r-${_pkgname,,}
pkgver=3.4.0
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
sha256sums=('936f39a90e347ce67a4e56319645d451bb8ea711a2bb6c9bb059847064f6b447')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
