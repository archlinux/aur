# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=energy
_pkgver=1.7-10
pkgname=r-${_pkgname,,}
pkgver=1.7.10
pkgrel=5
pkgdesc='E-Statistics: Multivariate Inference via the Energy of Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gsl
  r-rcpp
)
optdepends=(
  r-compquadform
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('543de4875c46cc90e711e71c45b082d962fbb5158a094f9f10d37d3f57e1bea7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
