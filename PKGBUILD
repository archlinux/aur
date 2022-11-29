# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBA
_pkgver=0.1-0
pkgname=r-${_pkgname,,}
pkgver=0.1.0
pkgrel=1
pkgdesc='Multilevel B-Spline Approximation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
)
optdepends=(
  r-sp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('78039905c5b98be2bb79a5f292187a2aca21ef449daeefea58b0cac53a5283af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
