# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=SummarizedExperiment
_bcver=1.36.0

pkgname=r-${_bcname,,}
pkgdesc="SummarizedExperiment container"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("any")
license=("Artistic2.0")

depends=(
    "r>=4.0.0"
    "r-biobase"
    "r-biocgenerics>=0.51.3"
    "r-delayedarray>=0.31.12"
    "r-genomeinfodb>=1.13.1"
    "r-genomicranges>=1.55.2"
    "r-iranges>=2.23.9"
    "r-matrixgenerics>=1.1.3"
    "r-s4arrays>=1.1.1"
    "r-s4vectors>=0.33.7"
)
optdepends=(
    "r-airway>=1.15.1"
    "r-annotate"
    "r-annotationdbi"
    "r-biocstyle"
    "r-digest"
    "r-genomicfeatures"
    "r-hdf5array>=1.7.5"
    "r-hgu95av2.db"
    "r-jsonlite"
    "r-knitr"
    "r-rhdf5"
    "r-rmarkdown"
    "r-runit"
    "r-singlecellexperiment"
    "r-sparsearray"
    "r-testthat"
    "r-txdb.hsapiens.ucsc.hg19.knowngene"
)

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("937d6b58c4d98ab7f5144c61403ac7d1ac819ab5cb816ae217bce4ae1dd73d62044b8dfc9c58a073362d4b4972e4f43c5db98ce065ec1b6cbe748fed33bacd93")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
