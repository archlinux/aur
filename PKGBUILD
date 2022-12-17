# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ImmuneSpaceR
_pkgver=1.26.1
pkgname=r-${_pkgname,,}
pkgver=1.26.1
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
sha256sums=('16bdba0529d8b8d5cb69ef28442e1a0e2a56348bcb55ceb12cce5bc258f97aa3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
