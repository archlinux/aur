# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ImmuneSpaceR
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='A Thin Wrapper around the ImmuneSpace Database'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-curl
  r-data.table
  r-digest
  r-flowcore
  r-flowworkspace
  r-ggplot2
  r-gplots
  r-heatmaply
  r-httr
  r-jsonlite
  r-pheatmap
  r-plotly
  r-preprocesscore
  r-r6
  r-rlabkey
  r-rmarkdown
  r-scales
)
optdepends=(
  r-covr
  r-knitr
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a7f92892495e48bf9711b7a48460f518956d5302b7ea64d263f089e7d299450')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
