# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ks
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
pkgrel=1
pkgdesc='Kernel Smoothing'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fnn
  r-kernlab
  r-mclust
  r-multicool
  r-mvtnorm
  r-plot3d
  r-pracma
)
optdepends=(
  r-geometry
  r-mass
  r-misc3d
  r-oz
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('da5ba3b24015071563c51a82a6e322631f2ce0112f5a3103d40f65e7e487a1f2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
