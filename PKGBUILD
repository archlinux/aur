# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ROI.plugin.lpsolve
_pkgver=1.0-2
pkgname=r-${_pkgname,,}
pkgver=1.0.2
pkgrel=1
pkgdesc="'lp_solve' Plugin for the 'R' Optimization Infrastructure"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lpsolveapi
  r-roi
)
optdepends=(
  r-slam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b225677ed988bf349ae59f6c682f553c8c7b128f23b2bcb71f6ae982bf0bef75')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
