# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SingleCellSignalR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Cell Signalling Using Single Cell RNAseq Data Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocmanager
  r-circlize
  r-data.table
  r-edger
  r-foreach
  r-gplots
  r-igraph
  r-limma
  r-multtest
  r-pheatmap
  r-rtsne
  r-scran
  r-stringr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('10d81f52a70418767e273289b7fbfb8f8ae6ee87bfeb58f5687c2e6083390e79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
