# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=golem
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=0.4.0
pkgrel=1
pkgdesc='A Framework for Robust Shiny Applications'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-attempt
  r-cli
  r-config
  r-crayon
  r-desc
  r-fs
  r-here
  r-htmltools
  r-pkgload
  r-roxygen2
  r-rstudioapi
  r-shiny
  r-usethis
  r-yaml
)
optdepends=(
  r-attachment
  r-covr
  r-devtools
  r-dockerfiler
  r-knitr
  r-pkgbuild
  r-pkgdown
  r-processx
  r-purrr
  r-rcmdcheck
  r-renv
  r-rlang
  r-rmarkdown
  r-rsconnect
  r-spelling
  r-stringr
  r-testthat
  r-tools
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb76f081d2dd818519b0fadfc92cf7ad3ff0673eae3bd0dc2f3522ebf9cc5662')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
