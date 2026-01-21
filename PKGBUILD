# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hdrcde
_pkgver=3.5.0
pkgname=r-${_pkgname,,}
pkgver=3.5.0
pkgrel=1
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
sha256sums=('3affe9cafe987fd0973b54ed50a423de60ec6412aa1416733543448cddc5b32a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
