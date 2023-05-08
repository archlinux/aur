# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SC3
_pkgver=1.28.1
pkgname=r-${_pkgname,,}
pkgver=1.28.1
pkgrel=1
pkgdesc='Single-Cell Consensus Clustering'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-doparallel
  r-dorng
  r-e1071
  r-foreach
  r-ggplot2
  r-pheatmap
  r-rcpp
  r-rcpparmadillo
  r-robustbase
  r-rocr
  r-rrcov
  r-s4vectors
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
  r-writexls
)
optdepends=(
  r-knitr
  r-mclust
  r-rmarkdown
  r-scater
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('420eb3f97ef5420936a82a9adb81b6e1abf090088583384d163137f3b639738c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
