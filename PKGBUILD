# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=earth
_pkgver=5.3.1
pkgname=r-${_pkgname,,}
pkgver=5.3.1
pkgrel=4
pkgdesc='Multivariate Adaptive Regression Splines'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-formula
  r-plotmo
  r-teachingdemos
)
optdepends=(
  r-gam
  r-mass
  r-mda
  r-mgcv
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0bbe06ba974ceb8ec5de1d59cb53f9487d1828d7130fe2503c48b6cb449c4b03')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
