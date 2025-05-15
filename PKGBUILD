# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LIM
_pkgver=1.4.7.2
pkgname=r-${_pkgname,,}
pkgver=1.4.7.2
pkgrel=1
pkgdesc='Linear Inverse Model examples and solution methods.'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-diagram
  r-limsolve
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('461df14b090b1f4f74f91e1f8120057bf47bc586cb41fa3653f66a96c014337a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
