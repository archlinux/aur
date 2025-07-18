# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GladiaTOX
_pkgver=1.24.1
pkgname=r-${_pkgname,,}
pkgver=1.24.1
pkgrel=1
pkgdesc='R Package for Processing High Content Screening data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-brew
  r-data.table
  r-dbi
  r-ggplot2
  r-ggrepel
  r-numderiv
  r-rcolorbrewer
  r-rcurl
  r-rjsonio
  r-rmariadb
  r-rsqlite
  r-stringr
  r-tidyr
  r-xml
  r-xtable
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0406551b0fdfd94e45744fce21620d3d9a2a16eb5804bc6b94060e8b7687b428')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
