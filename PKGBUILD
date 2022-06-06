# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MIGSA
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Massive and Integrative Gene Set Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-edger
  r-futile.logger
  r-ggdendro
  r-ggplot2
  r-go.db
  r-gostats
  r-graph
  r-gseabase
  r-ismev
  r-jsonlite
  r-limma
  r-matrixstats
  r-org.hs.eg.db
  r-rbgl
  r-reshape2
  r-rgraphviz
  r-vegan
)
optdepends=(
  r-biocstyle
  r-breastcancermainz
  r-breastcancernki
  r-breastcancertransbig
  r-breastcancerunt
  r-breastcancerupp
  r-breastcancervdx
  r-knitr
  r-mgsz
  r-migsadata
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cb8530d68b259f505620a3c2bd4e9e087a27e5b11f540fff310bbf9efe184e46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
