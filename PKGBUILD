# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phangorn
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=2.10.0
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
  r-prettydoc
  r-rgl
  r-rmarkdown
  r-seqinr
  r-seqlogo
  r-tinytest
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d153f87053a1e6eebf46be98fad3f118349008c559a6797b55613629cab85dce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
