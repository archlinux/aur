# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FindMyFriends
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=5
pkgdesc='Microbial Comparative Genomics in R'
arch=('x86_64')
url="https://bioconductor.org/packages/3.14/${_pkgname}"
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
sha256sums=('SKIP')

prepare(){
  # No such file, its only in description.
  sed -i "/'zzz.R'/d" ${_pkgname}/DESCRIPTION
}

build() {
  tar -zcvf ${_pkgname}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
