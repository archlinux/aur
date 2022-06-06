# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=exactRankTests
_pkgver=0.8-35
pkgname=r-${_pkgname,,}
pkgver=0.8.35
pkgrel=1
pkgdesc='Exact Distributions for Rank and Permutation Tests'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-survival
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7eb4a9ff431a306f634a5feba39c381afb17573e24230976ece843c84e8969e3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
