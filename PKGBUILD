# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bsplus
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=0.1.3
pkgrel=4
pkgdesc='Adds Functionality to the R Markdown + Shiny Bootstrap Framework'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-glue
  r-htmltools
  r-jsonlite
  r-lubridate
  r-magrittr
  r-purrr
  r-rmarkdown
  r-stringr
)
optdepends=(
  r-covr
  r-knitr
  r-markdown
  r-shiny
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd57c232992e52f3fb9bb11edfda88264fe616741ad3b3f084aee0de451436bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
