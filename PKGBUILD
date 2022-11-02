# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ComPrAn
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Complexome Profiling Analysis package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-data.table
  r-dplyr
  r-dt
  r-forcats
  r-ggplot2
  r-magrittr
  r-purrr
  r-rcolorbrewer
  r-rio
  r-rlang
  r-scales
  r-shiny
  r-shinydashboard
  r-shinyjs
  r-stringr
  r-tibble
  r-tidyr
  r-venndiagram
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d093bec95aca7891f8c191eae9c70616c69244e59a2d92a6e6387b55791cc9fe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
