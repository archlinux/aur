# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tximport
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Import and summarize transcript-level estimates for transcript- and gene-level analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-deseq2
  r-edger
  r-eds
  r-jsonlite
  r-knitr
  r-limma
  r-matrix
  r-matrixstats
  r-readr
  r-rhdf5
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('611e7e747a46a4450461019a1a0b84cfe067a55538675da62ce03249acdba14e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
