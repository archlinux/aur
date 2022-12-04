# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=openCyto
_pkgver=2.10.1
pkgname=r-${_pkgname,,}
pkgver=2.10.1
pkgrel=1
pkgdesc='Hierarchical Gating Pipeline for flow cytometry data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-bh
  r-biobase
  r-biocgenerics
  r-cpp11
  r-data.table
  r-flowclust
  r-flowcore
  r-flowviz
  r-flowworkspace
  r-graph
  r-ncdfflow
  r-rbgl
  r-rcolorbrewer
)
optdepends=(
  r-cytoml
  r-flowstats
  r-flowworkspacedata
  r-ggcyto
  r-knitr
  r-markdown
  r-mass
  r-parallel
  r-rmarkdown
  r-testthat
  r-tools
  r-utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('20438f78c21727634fee387658dd798284e796dddd411f75f80f7d0b5b529a9b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
