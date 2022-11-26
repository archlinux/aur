# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcgmin
_pkgver=2022-4.30
pkgname=r-${_pkgname,,}
pkgver=2022.4.30
pkgrel=4
pkgdesc='Conjugate Gradient Minimization of Nonlinear Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-optextras
)
optdepends=(
  r-numderiv
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2684b8e7fb970da2afbc00e482031cf4447416249d04c4c1740400ad112fb911')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
