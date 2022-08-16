# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=treeio
_pkgver=1.20.2
pkgname=r-${_pkgname,,}
pkgver=1.20.2
pkgrel=1
pkgdesc='Base Classes and Functions for Phylogenetic Tree Input and Output'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-dplyr
  r-jsonlite
  r-magrittr
  r-rlang
  r-tibble
  r-tidytree
)
optdepends=(
  r-biostrings
  r-ggplot2
  r-ggtree
  r-igraph
  r-knitr
  r-phangorn
  r-prettydoc
  r-rmarkdown
  r-testthat
  r-tidyr
  r-vroom
  r-xml2
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a103a6953abf2014bd1bb8b2da4f2d7375bab338724d0bf864085981a85fd5cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
