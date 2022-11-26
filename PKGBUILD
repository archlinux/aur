# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sm
_pkgver=2.2-5.7.1
pkgname=r-${_pkgname,,}
pkgver=2.2.5.7.1
pkgrel=6
pkgdesc='Smoothing Methods for Nonparametric Regression and Density Estimation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-gam
  r-interp
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
sha256sums=('ea0cc32eb14f6c18beba0bede66ed37bc5341bd3f76c1a7ae56d7254693e1457')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
