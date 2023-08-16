# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gss
_pkgver=2.2-7
pkgname=r-${_pkgname,,}
pkgver=2.2.7
pkgrel=1
pkgdesc='General Smoothing Splines'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3b13144702c570c83462b4ea2ad17f4bd630cff5bf2ab0347a33c7e86a4f3f6a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
