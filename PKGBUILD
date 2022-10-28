# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=amap
_pkgver=0.8-19
pkgname=r-${_pkgname,,}
pkgver=0.8.19
pkgrel=1
pkgdesc='Another Multidimensional Analysis Package'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-biobase
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7349ea684b69eba0fcc48f78b7ac09a838d95d3bc0c6a94b6055605ac0291900')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
