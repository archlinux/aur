# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rrcov
_pkgver=1.7-4
pkgname=r-${_pkgname,,}
pkgver=1.7.4
pkgrel=1
pkgdesc='Scalable Robust Estimators with High Breakdown Point'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
  r-pcapp
  r-robustbase
)
optdepends=(
  r-grid
  r-mass
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6341eddc590fe11fb8545aa9084f5d99cd93415a599022ba63f1af890617754a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
