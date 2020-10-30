# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomicAlignments
_bcver=1.26.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Representation and manipulation of short genomic alignments"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=3.5.0' 'r-biocgenerics>=0.15.3' 'r-s4vectors>=0.27.12' 'r-iranges>=2.23.9' 'r-genomeinfodb>=1.13.1' 'r-genomicranges>=1.41.5' 'r-summarizedexperiment>=1.9.13' 'r-biostrings>=2.55.7' 'r-rsamtools>=1.31.2' r-biocparallel)
optdepends=(r-shortread r-rtracklayer r-bsgenome r-genomicfeatures r-rnaseqdata.hnrnpc.bam.chr14 r-pasillabamsubset r-txdb.hsapiens.ucsc.hg19.knowngene r-txdb.dmelanogaster.ucsc.dm3.ensgene r-bsgenome.dmelanogaster.ucsc.dm3 r-bsgenome.hsapiens.ucsc.hg19 r-deseq2 r-edger r-runit r-biocstyle)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('794180a9b935cd4c01c61c1cc7232d9767daeeffa5a4ae4857da6aa34dbf25e1')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
