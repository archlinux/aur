# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomicRanges
_bcver=1.50.2
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Representation and manipulation of genomic intervals"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic2.0)
depends=(
    "r>=4.0.0"
    "r-biocgenerics>=0.37.0"
    "r-s4vectors>=0.27.12"
    "r-iranges>=2.31.2"
    "r-genomeinfodb>=1.15.2"
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
b2sums=("854b984dcaff9756f9d6878d0240bb9c2e879cab90476844c241c117ffdb00db27fd7f3e93a89d9fa733a270b6a84993fc20f83b09e1140a1be830f72ebf16c2")

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
