# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiRewire
_pkgver=3.34.0
pkgname=r-${_pkgname,,}
pkgver=3.34.0
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
sha256sums=('4d7526c04f8ad982f2b122fa91fa069f3cc5800eb33e6bc35ff7a78546abb7c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
