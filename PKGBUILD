# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bluster
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Clustering Algorithms for Bioconductor'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocneighbors
  r-biocparallel
  r-igraph
  r-rcpp
  r-s4vectors
  gcc
)
optdepends=(
  r-apcluster
  r-biocstyle
  r-dirichletmultinomial
  r-dynamictreecut
  r-fastcluster
  r-knitr
  r-kohonen
  r-mbkmeans
  r-pheatmap
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-scuttle
  r-testthat
  r-vegan
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a7b1818ca21442a1d1166f82e248e8eab5d02c21557d69fd87971db44e747ae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
