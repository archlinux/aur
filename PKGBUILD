# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiRewire
_pkgver=3.28.0
pkgname=r-${_pkgname,,}
pkgver=3.28.0
pkgrel=1
pkgdesc='High-performing routines for the randomization of a bipartite graph (or a binary event matrix), undirected and directed signed graph preserving degree distribution (or marginal totals)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-slam
  r-tsne
  r-rtsne
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('150a26b001279f173f8ef1bbbafb66ab1346c17495a3aedbe7483e5c883d7164')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
