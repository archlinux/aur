# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netresponse
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='Functional Network Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocstyle
  r-ggplot2
  r-graph
  r-igraph
  r-mclust
  r-minet
  r-plyr
  r-qvalue
  r-rcolorbrewer
  r-reshape2
  r-rgraphviz
  r-rmarkdown
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b940ac3924b984cedaafa8fbbcb94c02b859899f4b14d2a0b90ceda5b1b39e8e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
