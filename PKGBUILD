# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BB
_pkgver=2019.10-1
pkgname=r-${_pkgname,,}
pkgver=2019.10.1
pkgrel=4
pkgdesc='Solving and Optimizing Large-Scale Nonlinear Systems'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-quadprog
)
optdepends=(
  r-hmisc
  r-numderiv
  r-setrng
  r-survival
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('04d0b6ce6e5f070b109478a6005653dbe78613bb4e3ea4903203d851b5d3c94d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
