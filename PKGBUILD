# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiRewire
_pkgver=3.40.0
pkgname=r-${_pkgname,,}
pkgver=3.40.0
pkgrel=1
pkgdesc='High-performing routines for the randomization of a bipartite graph (or a binary event matrix), undirected and directed signed graph preserving degree distribution (or marginal totals)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-rtsne
  r-slam
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a7383b6cfc82cdbb6746cd31fb3b4da2f2572ebaa9e568b0ef25f4d551ebb2a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
