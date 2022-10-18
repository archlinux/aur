# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=misc3d
_pkgver=0.9-1
pkgname=r-${_pkgname,,}
pkgver=0.9.1
pkgrel=9
pkgdesc='Miscellaneous 3D Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  tk
)
optdepends=(
  r-mass
  r-rgl
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a07bbb0de153e806cd79675ed478d2d9221cff825654f59a71a9cf61f4293d65')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
