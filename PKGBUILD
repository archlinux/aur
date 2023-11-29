# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distances
_pkgver=0.1.10
pkgname=r-${_pkgname,,}
pkgver=0.1.10
pkgrel=1
pkgdesc='Tools for Distance Metrics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eb94d2146ed693eaba2d122c5799933bb74916e5d47d341bad70fbac9445d166')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
