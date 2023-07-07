# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cbpManager
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=1.8.1
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
sha256sums=('6862abaedb3c1078a2bb2da8b144e7b47678c39d976c38a5be70b3a9ce74aece')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
