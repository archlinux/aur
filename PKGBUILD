# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scPCA
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Sparse Contrastive Principal Component Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-biocparallel
  r-coop
  r-delayedarray
  r-dplyr
  r-elasticnet
  r-kernlab
  r-matrixgenerics
  r-matrixstats
  r-origami
  r-purrr
  r-rdpack
  r-rspectra
  r-scaledmatrix
  r-sparsepca
  r-stringr
  r-tibble
)
optdepends=(
  r-biocstyle
  r-covr
  r-delayedmatrixstats
  r-ggplot2
  r-ggpubr
  r-knitr
  r-microbenchmark
  r-rmarkdown
  r-singlecellexperiment
  r-sparsematrixstats
  r-splatter
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c27df5020915ff86c23b0faa81782b65c5eaff1285b66e17405004e469d37c1b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
