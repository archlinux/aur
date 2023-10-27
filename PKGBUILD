# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=unmarked
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgver=1.3.2
pkgrel=3
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
sha256sums=('a1d21619c8627419e09646cc12e09457c0ea8989caf2e674d032e59b310cf883')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
