# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSAR
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Gene Set Analysis in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
)
optdepends=(
  r-all
  r-annotate
  r-biobase
  r-biocstyle
  r-edger
  r-genefilter
  r-gseabase
  r-gsvadata
  r-hgu95av2.db
  r-mass
  r-org.hs.eg.db
  r-tweedeseqcountdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8f826bc3a03af80c7179b8c6f8fe04028a5e7242996db14667d7c361186fb1b1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
