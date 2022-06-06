# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=googleAuthR
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=2.0.0
pkgrel=3
pkgdesc='Authenticate and Create Google APIs'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-cli
  r-digest
  r-gargle
  r-httr
  r-jsonlite
  r-memoise
  r-rlang
)
optdepends=(
  r-bigqueryr
  r-covr
  r-devtools
  r-formatr
  r-googleanalyticsr
  r-knitr
  r-miniui
  r-rmarkdown
  r-roxygen2
  r-rstudioapi
  r-shiny
  r-testthat
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba504baf3bde2e1b3e988bee7602df5765cc6ca542cf0ab76a782c4e60966feb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
