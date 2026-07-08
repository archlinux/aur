# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=golem
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=1.0.1
pkgrel=1
pkgdesc='A Framework for Robust Shiny Applications'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-attempt
  r-config
  r-here
  r-htmltools
  r-rlang
  r-shiny
  r-yaml
)
optdepends=(
  r-attachment
  r-cli
  r-covr
  r-crayon
  r-desc
  r-devtools
  r-dockerfiler
  r-fs
  r-knitr
  r-pkgbuild
  r-pkgdown
  r-pkgload
  r-processx
  r-purrr
  r-rcmdcheck
  r-renv
  r-rmarkdown
  r-roxygen2
  r-rsconnect
  r-rstudioapi
  r-spelling
  r-stringr
  r-testthat
  r-tools
  r-usethis
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ceee20e347b952477ddfcbd4f0502ce89f51c91dacd336c7fffa69df3d5135ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
