# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OncoSimulR
_pkgver=4.12.0
pkgname=r-${_pkgname,,}
pkgver=4.12.0
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
sha256sums=('d96a1d0b2c9cd5a1de4697b70ff5508292f1496c8927a4214bec7d3e6ec3c9a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
