# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVILBilling
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Provide functions to retrieve and report on usage expenses in NHGRI AnVIL (anvilproject.org).'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bigrquery
  r-dbi
  r-dplyr
  r-dt
  r-ggplot2
  r-lubridate
  r-magrittr
  r-plotly
  r-shiny
  r-shinytoastr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('26b42f0835b690a75acc4b6806f5751c321bb7ba9923f3a7f4d68660034ef2bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
