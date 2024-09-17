# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phangorn
_pkgver=2.12.1
pkgname=r-${_pkgname,,}
pkgver=2.12.1
pkgrel=1
pkgdesc='Phylogenetic Reconstruction and Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-digest
  r-fastmatch
  r-generics
  r-igraph
  r-quadprog
  r-rcpp
)
optdepends=(
  r-biostrings
  r-knitr
  r-magick
  r-rgl
  r-rmarkdown
  r-seqinr
  r-seqlogo
  r-tinytest
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9dc59c7806b4ba5d2d168d0504fdd5a10778aa24ef2c7014af92c3a2f1fe9ee7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
