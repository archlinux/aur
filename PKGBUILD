# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=loose.rock
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=5
pkgdesc='Tools for Survival Analysis and Data Science'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
  r-dplyr
  r-futile.options
  r-ggplot2
  r-httr
  r-reshape2
)
optdepends=(
  r-biomart
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-survival
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f934b6258ee7d8607fc8e3832d1855af769eff8382c8c7d962c34651d1ade38e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
