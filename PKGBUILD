# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kSamples
_pkgver=1.2-9
pkgname=r-${_pkgname,,}
pkgver=1.2.9
pkgrel=4
pkgdesc='K-Sample Rank Tests and their Combinations'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-suppdists
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba3ec4af3dfcf7cf12f0b784ef67bfea565e16985647ead904629886cc1542ff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
