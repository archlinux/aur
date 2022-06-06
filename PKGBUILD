# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ROI.plugin.lpsolve
_pkgver=1.0-1
pkgname=r-${_pkgname,,}
pkgver=1.0.1
pkgrel=4
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
sha256sums=('4fcb0927c05601b4ee9d44031577fee3cc04af4523942492f924ad7cf064a9c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
