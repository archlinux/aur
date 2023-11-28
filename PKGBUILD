# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpSolveAPI
_pkgver=5.5.2.0-17.11
pkgname=r-${_pkgname,,}
pkgver=5.5.2.0.17.11
pkgrel=1
pkgdesc="R Interface to 'lp_solve' Version 5.5.2.0"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b08d6cae4fc17575adf5df0113ea5f4f819bb2c7f87987e0d66c8eabfc933fa4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
