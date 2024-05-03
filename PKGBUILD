# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scDblFinder
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('802774ce4480105ed3137e27d848f05bf1bc30b62072109171f1f52e6156e3da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
