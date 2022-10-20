# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=learnr
_pkgver=0.11.1
pkgname=r-${_pkgname,,}
pkgver=0.11.1
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
  r-rmarkdown
  r-rprojroot
  r-shiny
  r-withr
)
optdepends=(
  r-callr
  r-rlang
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fa8fceca3023a7cf6128b4b80b4e01f1c6dc4a692df6e53c5b75f9b1e12069dc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
