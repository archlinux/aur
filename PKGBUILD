# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=valr
_pkgver=0.6.4
pkgname=r-${_pkgname,,}
pkgver=0.6.4
pkgrel=4
pkgdesc='Genome Interval Arithmetic'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-broom
  r-dplyr
  r-ggplot2
  r-rcpp
  r-readr
  r-rlang
  r-rtracklayer
  r-stringr
  r-tibble
  gcc
)
optdepends=(
  r-bench
  r-covr
  r-cowplot
  r-curl
  r-dbi
  r-dbplyr
  r-devtools
  r-dt
  r-genomicranges
  r-iranges
  r-knitr
  r-purrr
  r-rmariadb
  r-rmarkdown
  r-s4vectors
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('93fce804d76c44d91c5ab3cd70298cfef253c9fb842f5122cf06aeb8730ca435')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
