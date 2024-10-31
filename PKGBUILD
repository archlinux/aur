# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cbpManager
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Generate, manage, and edit data and metadata files suitable for the import in cBioPortal for Cancer Genomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-basilisk
  r-dplyr
  r-dt
  r-htmltools
  r-jsonlite
  r-magrittr
  r-markdown
  r-plyr
  r-rapportools
  r-reticulate
  r-rintrojs
  r-rlang
  r-shiny
  r-shinybs
  r-shinycssloaders
  r-shinydashboard
  r-vroom
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('180ceeaeae9b3693548178e48091593d085b71fe26122a4b873f1e7dd48bad8f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
