# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomicAlignments
_bcver=1.22.1
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Representation and manipulation of short genomic alignments"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=3.5.0' 'r-biocgenerics>=0.15.3' 'r-s4vectors>=0.23.19' 'r-iranges>=2.15.22' 'r-genomeinfodb>=1.13.1' 'r-genomicranges>=1.37.2' 'r-summarizedexperiment>=1.9.13' 'r-biostrings>=2.47.6' 'r-rsamtools>=1.31.2' r-biocparallel)
makedepends=(gcc)
optdepends=(r-shortread r-rtracklayer r-bsgenome r-genomicfeatures r-rnaseqdata.hnrnpc.bam.chr14 r-pasillabamsubset r-txdb.hsapiens.ucsc.hg19.knowngene r-txdb.dmelanogaster.ucsc.dm3.ensgene r-bsgenome.dmelanogaster.ucsc.dm3 r-bsgenome.hsapiens.ucsc.hg19 r-deseq2 r-edger r-runit r-biocstyle)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
md5sums=('6fb92061c3ffbeb89423f731f662f9d1')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
