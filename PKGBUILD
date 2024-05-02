# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SC3
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
  r-biocstyle
  r-knitr
  r-mclust
  r-rmarkdown
  r-scater
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d9ead64f1b2ab75aec2487db9b4195905e5c59e6bf40557478c7572ce599977a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
