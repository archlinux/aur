# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LogicReg
_pkgver=1.6.5
pkgname=r-${_pkgname,,}
pkgver=1.6.5
pkgrel=1
pkgdesc='Logic Regression'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de0360b1e3d4bb5ad664da57bb86c7983017a14cc37017c31c2c8036b2cc5914')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
