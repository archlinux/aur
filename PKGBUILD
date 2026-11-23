# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scDblFinder
_pkgver=1.26.9
pkgname=r-${_pkgname,,}
pkgver=1.26.9
pkgrel=1
pkgdesc='scDblFinder'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-biocsingular
  r-bluster
  r-delayedarray
  r-genomeinfodb
  r-genomicranges
  r-igraph
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scater
  r-scran
  r-scrapper
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-xgboost
)
optdepends=(
  r-biocstyle
  r-circlize
  r-complexheatmap
  r-dplyr
  r-ggplot2
  r-knitr
  r-mbkmeans
  r-rmarkdown
  r-scrnaseq
  r-testthat
  r-viridislite
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d09ea9982f0785d7e05989e3767f6daf56b32df2c4ba1a02a6e2e23740385f0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
