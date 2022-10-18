# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=golem
_pkgver=0.3.5
pkgname=r-${_pkgname,,}
pkgver=0.3.5
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
  r-dockerfiler
  r-fs
  r-here
  r-htmltools
  r-jsonlite
  r-pkgload
  r-remotes
  r-rlang
  r-roxygen2
  r-rstudioapi
  r-shiny
  r-testthat
  r-usethis
  r-yaml
)
optdepends=(
  r-covr
  r-devtools
  r-glue
  r-knitr
  r-pkgbuild
  r-pkgdown
  r-processx
  r-purrr
  r-rcmdcheck
  r-rmarkdown
  r-rsconnect
  r-spelling
  r-stringr
  r-tools
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('94b576387ceeaf678aed2d974ddee84d1f5031315deb0f866510c08172a05366')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
