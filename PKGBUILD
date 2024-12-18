# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmmquant
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='RNA-Seq multi-mapping Reads Quantification Tool'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-apeglm
  r-biocstyle
  r-deseq2
  r-devtools
  r-genomicranges
  r-org.mm.eg.db
  r-rcpp
  r-s4vectors
  r-summarizedexperiment
  r-tbx20bamsubset
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f215c3d8dc75d9ab9c60b69cfd44c33d2c63108d1260edc2a814ac151ccf8fbe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
