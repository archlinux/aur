# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rTensor
_pkgver=1.4.8
pkgname=r-${_pkgname,,}
pkgver=1.4.8
pkgrel=4
pkgdesc='Tools for Tensor Analysis and Decomposition'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0e7d193996fc3ed9db98bdf1e1127c081aec7073530af6cad344401d15cf44cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
