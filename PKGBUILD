# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vcfR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=3
pkgdesc='Manipulate and Visualize VCF Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-dplyr
  r-magrittr
  r-memuse
  r-pinfsc50
  r-rcpp
  r-stringr
  r-tibble
  r-vegan
  r-viridislite
)
optdepends=(
  r-adegenet
  r-ggplot2
  r-knitr
  r-poppr
  r-reshape2
  r-rmarkdown
  r-scales
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dd87ff010365de363864a44ca49887c0fdad0dd18d0d9c66e44e39c2d4581d52')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
