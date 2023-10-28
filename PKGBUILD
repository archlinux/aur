# system requirements: JRE 8+
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HiCDCPlus
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Hi-C Direct Caller Plus'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bbmle
  r-biostrings
  r-bsgenome
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicinteractions
  r-genomicranges
  r-interactionset
  r-iranges
  r-pscl
  r-r.utils
  r-rcpp
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-tibble
  r-tidyr
  java-runtime
)
optdepends=(
  r-biocfilecache
  r-biocgenerics
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.mmusculus.ucsc.mm9
  r-deseq2
  r-hitc
  r-knitr
  r-matrix
  r-parallel
  r-rappdirs
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('27cf53579d296cb9eb3207eceb6dba5db6620c72b55a60f8f2cac44089bdc50a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
