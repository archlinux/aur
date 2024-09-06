# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adehabitatLT
_pkgver=0.3.28
pkgname=r-${_pkgname,,}
pkgver=0.3.28
pkgrel=1
pkgdesc='Analysis of Animal Movements'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ade4
  r-adehabitatma
  r-circstats
  r-sp
)
optdepends=(
  r-mass
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6c213b6d81f622327a15a6751f670b40c6f15d3d20f9e2613a445cb393883dc2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
