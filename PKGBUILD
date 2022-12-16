# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enhancerHomologSearch
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=1.4.1
pkgrel=1
pkgdesc='Identification of putative mammalian orthologs to given enhancer'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocfilecache
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-httr
  r-iranges
  r-jsonlite
  r-motifmatchr
  r-rcpp
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-bsgenome.drerio.ucsc.danrer10
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-knitr
  r-motifdb
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rmarkdown
  r-testthat
  r-tfbstools
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a2844f7ec2d1f998074a9cd0b1c6d22cb50a9802a9f00701f9e35816eb4689a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
