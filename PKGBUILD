# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomicRanges
_bcver=1.39.3
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Representation and manipulation of genomic intervals"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=2.10' 'r-biocgenerics>=0.25.3' 'r-s4vectors>=0.25.14' 'r-iranges>=2.21.6' 'r-genomeinfodb>=1.15.2' 'r-xvector>=0.27.2')
makedepends=(gcc)
optdepends=(r-biobase r-annotationdbi r-annotate r-biostrings r-summarizedexperiment r-rsamtools r-genomicalignments r-rtracklayer r-bsgenome r-genomicfeatures r-gviz r-variantannotation r-annotationhub r-deseq2 r-dexseq r-edger r-kegggraph r-rnaseqdata.hnrnpc.bam.chr14 r-pasillabamsubset r-kegg.db r-hgu95av2.db r-hgu95av2probe r-bsgenome.scerevisiae.ucsc.saccer2 r-bsgenome.hsapiens.ucsc.hg19 bsgenome.mmusculus.ucsc.mm10 r-txdb.athaliana.biomart.plantsmart22 txdb.dmelanogaster.ucsc.dm3.ensgene r-txdb.hsapiens.ucsc.hg19.knowngene r-txdb.mmusculus.ucsc.mm10.knowngene r-runit r-digest r-knitr r-biocstyle)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
md5sums=('21b7e05689fa56405e3fd7e1db062e69')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
