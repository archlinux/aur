# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=learnr
_pkgver=0.11.3
pkgname=r-${_pkgname,,}
pkgver=0.11.3
pkgrel=3
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
sha256sums=('504db8ab2ece10b8379176e54900d4fe67f592d8d0f9479cf3f406e9ce855eaf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
