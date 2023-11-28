# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qs
_pkgver=0.25.6
pkgname=r-${_pkgname,,}
pkgver=0.25.6
pkgrel=1
pkgdesc='Quick Serialization of R Objects'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rapiserialize
  r-rcpp
  r-stringfish
)
optdepends=(
  r-data.table
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ac1e0041fbdd75c454d61305b5c14300b1e3f51a9b824ede2dcacf8312a62aee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
