# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gMWT
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=1.1.1
pkgrel=4
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
sha256sums=('2318f11f58f9f8a8a1b4298b4769628846dd967fe392e2b308c065ef10297ced')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
