# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=openCyto
_pkgver=2.8.2
pkgname=r-${_pkgname,,}
pkgver=2.8.2
pkgrel=1
pkgdesc='Hierarchical Gating Pipeline for flow cytometry data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-clue
  r-data.table
  r-flowclust
  r-flowcore
  r-flowstats
  r-flowviz
  r-flowworkspace
  r-graph
  r-gtools
  r-ks
  r-ncdfflow
  r-plyr
  r-r.utils
  r-rbgl
  r-rcolorbrewer
  r-rcpp
  r-rrcov
)
optdepends=(
  r-cytoml
  r-flowworkspacedata
  r-ggcyto
  r-knitr
  r-markdown
  r-parallel
  r-rmarkdown
  r-testthat
  r-tools
  r-utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a3de6596f03536e70aeb3f800861fdb53f4f6514c9d36499061aed94016d883d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
