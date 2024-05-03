# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MungeSumstats
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Standardise summary statistics from GWAS'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-googleauthr
  r-httr
  r-iranges
  r-jsonlite
  r-magrittr
  r-r.utils
  r-rcurl
  r-rtracklayer
  r-stringr
  r-variantannotation
)
optdepends=(
  r-badger
  r-biocgenerics
  r-biocparallel
  r-biocstyle
  r-bsgenome.hsapiens.1000genomes.hs37d5
  r-bsgenome.hsapiens.ncbi.grch38
  r-covr
  r-genomicfiles
  r-knitr
  r-markdown
  r-matrixgenerics
  r-rmarkdown
  r-rsamtools
  r-s4vectors
  r-snplocs.hsapiens.dbsnp144.grch37
  r-snplocs.hsapiens.dbsnp144.grch38
  r-snplocs.hsapiens.dbsnp155.grch37
  r-snplocs.hsapiens.dbsnp155.grch38
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9bf86d9a22af9fed9823968787d42336f04e37dfb40c6fad90cc7f5b7b97ba9a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
