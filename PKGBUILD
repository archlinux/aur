# system requirements: C++11, jupyter nbconvert (see nbconvertR’s INSTALLfile)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=destiny
_pkgver=3.20.0
pkgname=r-${_pkgname,,}
pkgver=3.20.0
pkgrel=1
pkgdesc='Creates diffusion maps'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-ggplot.multistats
  r-ggplot2
  r-ggthemes
  r-irlba
  r-knn.covertree
  r-pcamethods
  r-proxy
  r-rcpp
  r-rcppeigen
  r-rcpphnsw
  r-rspectra
  r-scales
  r-scatterplot3d
  r-singlecellexperiment
  r-smoother
  r-summarizedexperiment
  r-tidyr
  r-tidyselect
  r-vim
  gcc
  jupyter-nbconvert
)
optdepends=(
  r-conflicted
  r-cowplot
  r-fnn
  r-gridextra
  r-igraph
  r-knitr
  r-org.mm.eg.db
  r-repr
  r-rgl
  r-rgl
  r-rmarkdown
  r-scran
  r-scrnaseq
  r-singlecellexperiment
  r-testthat
  r-tidyverse
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('43ed9cce5e01419697ea965ee3257a473eca071716aa8b824c09655791dd5b95')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
