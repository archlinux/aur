# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=learnr
_pkgver=0.11.4
pkgname=r-${_pkgname,,}
pkgver=0.11.4
pkgrel=1
pkgdesc='Interactive Tutorials for R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-checkmate
  r-curl
  r-digest
  r-ellipsis
  r-evaluate
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-knitr
  r-lifecycle
  r-markdown
  r-promises
  r-rappdirs
  r-renv
  r-rlang
  r-rmarkdown
  r-rprojroot
  r-shiny
  r-withr
)
optdepends=(
  r-bslib
  r-callr
  r-dbi
  r-httpuv
  r-later
  r-reticulate
  r-rsqlite
  r-rstudioapi
  r-shinytest2
  r-sortable
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee64bd88cda6ddec8c9a2a561099461db915f6e99fe27e3c314b748faa1655d4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
