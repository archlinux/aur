# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multicrispr
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=1.10.1
pkgrel=1
pkgdesc='Multi-locus multi-purpose Crispr/Cas design'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-crisprseek
  r-data.table
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-karyoploter
  r-magrittr
  r-plyranges
  r-rbowtie
  r-reticulate
  r-rtracklayer
  r-stringi
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.scerevisiae.ucsc.saccer1
  r-ensembldb
  r-iranges
  r-knitr
  r-magick
  r-rmarkdown
  r-testthat
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1942942ad6145ecd0b895b5e03c2233f4aab0349f02c3b6455bc40689ed45615')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
