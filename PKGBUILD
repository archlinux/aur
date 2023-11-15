# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReactomeGSA
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=1.16.1
pkgrel=1
pkgdesc='Client for the Reactome Analysis Service for comparative multi-omics gene set analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-gplots
  r-httr
  r-jsonlite
  r-progress
  r-rcolorbrewer
  r-tidyr
)
optdepends=(
  r-biobase
  r-devtools
  r-edger
  r-knitr
  r-limma
  r-reactomegsa.data
  r-rmarkdown
  r-scater
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('faa9aad8c282a09909833ddcc261f502f1f786869e3425626771160881b9e35c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
