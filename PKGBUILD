# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phangorn
_pkgver=2.8.1
pkgname=r-${_pkgname,,}
pkgver=2.8.1
pkgrel=4
pkgdesc='Phylogenetic Reconstruction and Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-fastmatch
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
sha256sums=('6d471410ae29775104a94746936e8c1c54c7273dd289333973ec06dad489dc75')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
