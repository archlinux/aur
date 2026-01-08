# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mutoss
_pkgver=0.1-14
pkgname=r-${_pkgname,,}
pkgver=0.1.14
pkgrel=1
pkgdesc='Unified Multiple Testing Procedures'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-multcomp
  r-multtest
  r-mvtnorm
  r-plotrix
)
optdepends=(
  r-fdrtool
  r-lattice
  r-qvalue
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1f4ef7bb19b5c7056be4acd759f2776b6cbfdff3da5ce51ffae15f61cda35cbf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
