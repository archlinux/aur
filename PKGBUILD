# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=forestplot
_pkgver=3.1.0
pkgname=r-${_pkgname,,}
pkgver=3.1.0
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
  r-knitr
  r-rlang
  r-rmarkdown
  r-rmeta
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0be318107120197e6c9109ba18ba91c44989c921524ceb94584a1fb46e056376')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
