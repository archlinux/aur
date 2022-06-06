# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sm
_pkgver=2.2-5.7
pkgname=r-${_pkgname,,}
pkgver=2.2.5.7
pkgrel=4
pkgdesc='Smoothing Methods for Nonparametric Regression and Density Estimation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-akima
  r-gam
  r-misc3d
  r-rgl
  r-rpanel
  r-tcltk
  r-tkrplot
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2607a2cafc68d7e99005daf99e36f4a66eaf569ebb6b7500e962642cf58be80f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
