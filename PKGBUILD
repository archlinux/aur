# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomicRanges
_bcver=1.54.1

pkgname=r-${_bcname,,}
pkgdesc="Representation and manipulation of genomic intervals"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
license=("Artistic2.0")

depends=(
    "r>=4.0.0"
    "r-biocgenerics>=0.37.0"
    "r-genomeinfodb>=1.15.2"
    "r-iranges>=2.31.2"
    "r-s4vectors>=0.27.12"
    "r-xvector>=0.29.2"
)
optdepends=(
    "r-annotate"
    "r-annotationdbi"
    "r-annotationhub"
    "r-biobase"
    "r-biocstyle"
    "r-biostrings>=2.25.3"
    "r-bsgenome"
    "r-bsgenome.hsapiens.ucsc.hg19"
    "r-bsgenome.mmusculus.ucsc.mm10"
    "r-bsgenome.scerevisiae.ucsc.saccer2"
    "r-deseq2"
    "r-dexseq"
    "r-digest"
    "r-edger"
    "r-genomicalignments"
    "r-genomicfeatures"
    "r-gviz"
    "r-hgu95av2.db"
    "r-hgu95av2probe"
    "r-kegggraph"
    "r-keggrest"
    "r-knitr"
    "r-pasillabamsubset"
    "r-rmarkdown"
    "r-rnaseqdata.hnrnpc.bam.chr14"
    "r-rsamtools>=1.13.53"
    "r-rtracklayer"
    "r-runit"
    "r-summarizedexperiment>=0.1.5"
    "r-txdb.athaliana.biomart.plantsmart22"
    "r-txdb.dmelanogaster.ucsc.dm3.ensgene"
    "r-txdb.hsapiens.ucsc.hg19.knowngene"
    "r-txdb.mmusculus.ucsc.mm10.knowngene"
    "r-variantannotation"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=('d08b113f0f0afbcf154f91f582d4d91f8c97c79567ecd8993cc4ff2b1a3f63d62026b9c6c457b17f6fd470c82b73431a1a2a46508ed7062d5332c7146e881cb9')

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"

  if [[ -f "${_bcname}/LICENSE" ]]; then
    install -Dm0644 "${_bcname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
