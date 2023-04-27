# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yeastCC
_pkgver=1.39.0
pkgname=r-${_pkgname,,}
pkgver=1.39.0
pkgrel=1
pkgdesc='Spellman et al. (1998) and Pramila/Breeden (2006) yeast cell cycle microarray data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf3a74df7c01ff3ec53a7cd396f6069628455f0997c87b758f3344aa472d7a97')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
