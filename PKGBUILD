# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aws
_pkgver=2.5-3
pkgname=r-${_pkgname,,}
pkgver=2.5.3
pkgrel=1
pkgdesc='Adaptive Weights Smoothing'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-awsmethods
  r-gsl
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('154ed68785de8c4a02db1916dfe50862cf544865901936e864207ada777e5108')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
