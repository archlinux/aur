# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=unmarked
_pkgver=1.2.5
pkgname=r-${_pkgname,,}
pkgver=1.2.5
pkgrel=4
pkgdesc='Models for Data from Unmarked Animals'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  make
  r
  r-lme4
  r-pbapply
  r-plyr
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
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a54f49f42d30a7a69eb6c3db00d3cd2e1f8e549aec28fa5487fcdd27a37f87fe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
