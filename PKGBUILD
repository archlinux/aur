# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nsga2R
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=1.1
pkgrel=3
pkgdesc='Elitist Non-dominated Sorting Genetic Algorithm based on R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-mco
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('645111e633b5cd5b512e05ec9b943349c409fef6f8cf2ae81ae19958439b73ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
