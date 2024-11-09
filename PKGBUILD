# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BSgenome
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
pkgdesc='Software infrastructure for efficient representation of full genomes and their SNPs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocio
  r-biostrings
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-matrixstats
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-xvector
)
optdepends=(
  r-biobase
  r-biocmanager
  r-bsgenome.celegans.ucsc.ce2
  r-bsgenome.hsapiens.ncbi.grch38
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.hsapiens.ucsc.hg38.masked
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.rnorvegicus.ucsc.rn5
  r-bsgenome.scerevisiae.ucsc.saccer1
  r-bsgenomeforge
  r-hgu95av2probe
  r-runit
  r-snplocs.hsapiens.dbsnp144.grch38
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
  r-xtrasnplocs.hsapiens.dbsnp144.grch38
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('510657a451b1b2b983bcf1b8cfa9d43a9ad15753e66bed1d134e257eb3f86c29')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
