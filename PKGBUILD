# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scAnnotatR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Pretrained learning models for cell type prediction on single cell RNA-sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationhub
  r-ape
  r-caret
  r-data.tree
  r-dplyr
  r-e1071
  r-ggplot2
  r-kernlab
  r-proc
  r-rocr
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7beadc11c250c34add39ada8ef711e8c3952d03c22ab55c5bda9851acfd5fabf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
