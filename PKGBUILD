# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCOPE
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='A normalization and copy number estimation method for single-cell DNA sequencing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-desctools
  r-dnacopy
  r-doparallel
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-gplots
  r-iranges
  r-rcolorbrewer
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-knitr
  r-rmarkdown
  r-testthat
  r-wgsmapp
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('805f61ea44d48fe2a69bbc924fd9b36b74eae25fae4d3c65ce69ab9c4a53f3f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
