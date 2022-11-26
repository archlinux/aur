# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ptw
_pkgver=1.9-16
pkgname=r-${_pkgname,,}
pkgver=1.9.16
pkgrel=6
pkgdesc='Parametric Time Warping'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcppde
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e87c34b9eeaeabe3bfb937162e6cda4dd48d6bd6a97b9db8bb8303d131caa66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
