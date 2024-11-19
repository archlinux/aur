# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=forestplot
_pkgver=3.1.6
pkgname=r-${_pkgname,,}
pkgver=3.1.6
pkgrel=1
pkgdesc="Advanced Forest Plot Using 'grid' Graphics"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-checkmate
)
optdepends=(
  r-dplyr
  r-gmisc
  r-greg
  r-knitr
  r-purrr
  r-rlang
  r-rmarkdown
  r-rmeta
  r-rms
  r-testthat
  r-tibble
  r-tidyr
  r-tidyselect
  r-tidyverse
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('109f7c008c696abdb8b63d9ef48dc05a1fc2088ace2ae1c9e357509423455ec6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
