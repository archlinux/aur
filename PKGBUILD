# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hdrcde
_pkgver=3.4
pkgname=r-${_pkgname,,}
pkgver=3.4
pkgrel=4
pkgdesc='Highest Density Regions and Conditional Density Estimation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ash
  r-ggplot2
  r-ks
  r-locfit
  r-rcolorbrewer
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4341c6a021da46dcae3b1ef6d580e84dcf625c2b2139f537d0c26ec90899149b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
