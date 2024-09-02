# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=unmarked
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=1.4.3
pkgrel=1
pkgdesc='Models for Data from Unmarked Animals'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  make
  r
  r-lme4
  r-pbapply
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  r-tmb
)
optdepends=(
  r-knitr
  r-pkgdown
  r-raster
  r-rmarkdown
  r-shiny
  r-terra
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('21af910d35c17d9103224a2f75e56083c14f93f3c63ec0e630a2940322ddda88')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
