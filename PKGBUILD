# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genotypeeval
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='QA/QC of a gVCF or VCF file'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-rtracklayer
  r-variantannotation
)
optdepends=(
  r-rmarkdown
  r-snplocs.hsapiens.dbsnp141.grch38
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d4e2b92ddf1cb7f72cb131c05575fefa161d8c4527f9afb9530f6d120d6a2156')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
