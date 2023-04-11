# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adehabitatLT
_pkgver=0.3.27
pkgname=r-${_pkgname,,}
pkgver=0.3.27
pkgrel=3
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
sha256sums=('fd0bf996f7deacf62f40520e3a3ddccc5d46cf2477a56deb3559f99760922a6a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
