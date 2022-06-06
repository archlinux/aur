# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FindMyFriends
_pkgver=1.23.0
pkgname=r-${_pkgname,,}
pkgver=1.23.0
pkgrel=3
pkgdesc='Microbial Comparative Genomics in R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-digest
  r-dplyr
  r-filehash
  r-ggdendro
  r-ggplot2
  r-gtable
  r-igraph
  r-iranges
  r-kebabs
  r-rcpp
  r-reshape2
  r-s4vectors
)
makedepends=(
  git
)
optdepends=(
  r-biocstyle
  r-knitr
  r-reutils
  r-rmarkdown
  r-testthat
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}.git")
sha256sums=('e91305becc2fb8c276f57457eaf99c58a9f85b377b0b034a16a2ac2ea9a17075')

build() {
  tar -zcvf ${_pkgname}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
