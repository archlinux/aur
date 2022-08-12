# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpSolveAPI
_pkgver=5.5.2.0-17.8
pkgname=r-${_pkgname,,}
pkgver=5.5.2.0.17.8
pkgrel=1
pkgdesc="R Interface to 'lp_solve' Version 5.5.2.0"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('24346bbdfe86a955e0f831c42e14c0ad6f446e4cbd07b82ce81a824d7717569e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
