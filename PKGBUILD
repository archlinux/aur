# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scClassifR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=3
pkgdesc='Pretrained learning models for cell type prediction on single cell RNA-sequencing data'
arch=('any')
url="https://bioconductor.org/packages/3.14/bioc/html/scClassifR.html"
license=('MIT')
depends=(
  r
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
source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ff8b75c0b67f144986b7a6da513b531644ec262f3e58bc71ee0a281b0b4e345d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
