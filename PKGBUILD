# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rrcov
_pkgver=1.7-1
pkgname=r-${_pkgname,,}
pkgver=1.7.1
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
sha256sums=('e115a09997b46c7eed33017f748632c7d50a95ad621f1f452f22dfc714c9a4e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
