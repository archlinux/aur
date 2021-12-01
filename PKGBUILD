# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomicRanges
_bcver=1.46.1
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Representation and manipulation of genomic intervals"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=4.0.0' 'r-biocgenerics>=0.37.0' 'r-s4vectors>=0.27.12' 'r-iranges>=2.23.9' 'r-genomeinfodb>=1.15.2' 'r-xvector>=0.29.2')
optdepends=(r-biobase r-annotationdbi r-annotate r-biostrings r-summarizedexperiment r-rsamtools r-genomicalignments r-rtracklayer r-bsgenome r-genomicfeatures r-gviz r-variantannotation r-annotationhub r-deseq2 r-dexseq r-edger r-kegggraph r-rnaseqdata.hnrnpc.bam.chr14 r-pasillabamsubset r-keggrest r-hgu95av2.db r-hgu95av2probe r-bsgenome.scerevisiae.ucsc.saccer2 r-bsgenome.hsapiens.ucsc.hg19 bsgenome.mmusculus.ucsc.mm10 r-txdb.athaliana.biomart.plantsmart22 txdb.dmelanogaster.ucsc.dm3.ensgene r-txdb.hsapiens.ucsc.hg19.knowngene r-txdb.mmusculus.ucsc.mm10.knowngene r-runit r-digest r-knitr r-rmarkdown r-biocstyle)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('9df774cd514343a29f57d45a13889bf400d0abeaa2013cd396f7faa6f911798c')

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
