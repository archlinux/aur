# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TDARACNE
_pkgver=1.47.0
pkgname=r-${_pkgname,,}
pkgver=1.47.0
pkgrel=4
pkgdesc='Network reverse engineering from time course data.'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-genkern
  r-rgraphviz
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b82fb6253a47375dcbb09a5741ee58dcb4616a9c4318486d90d13ac6453feea7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
