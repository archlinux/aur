# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=SummarizedExperiment
_bcver=1.30.2

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
    "r-biocgenerics>=0.37.0"
    "r-delayedarray>=0.26.3"
    "r-genomeinfodb>=1.13.1"
    "r-genomicranges>=1.41.5"
    "r-iranges>=2.23.9"
    "r-matrixgenerics>=1.1.3"
    "r-s4arrays>=1.0.1"
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
    "r-testthat"
    "r-txdb.hsapiens.ucsc.hg19.knowngene"
)

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("f08b14854a6ad52c6e3e805b2e42d10c2f029af86f17affed97e664172c60b377efedfcf8f05d4172a05d7de6b2178e15f00344be10e5ecb0fad7677da212d11")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
