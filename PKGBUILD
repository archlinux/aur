# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gMWT
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=1.4
pkgrel=2
pkgdesc='Generalized Mann-Whitney Type Tests'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clinfun
  r-rcpp
  r-rcpparmadillo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2a96272939fcdd094a14723ef63d72e26bf963d3ca33f8e036fd256ab66a67c7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
