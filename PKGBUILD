# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=SummarizedExperiment
_bcver=1.26.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="SummarizedExperiment container"
arch=(any)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("Artistic-2.0")
depends=(
    "r>=4.0.0"
    r-biobase
	"r-biocgenerics>=0.37.0"
	"r-delayedarray>=0.15.10"
	"r-genomeinfodb>=1.13.1"
	"r-genomicranges>=1.41.5"
	"r-iranges>=2.23.9"
	"r-matrixgenerics>=1.1.3"
	"r-s4vectors>=0.27.12"
)
optdepends=(
	"r-airway>=1.15.1"
	r-annotate
	r-annotationdbi
	r-biocstyle
	r-digest
	r-genomicfeatures
    "r-hdf5array>=1.7.5"
	r-hgu95av2.db
	r-jsonlite
	r-knitr
	r-rhdf5
	r-rmarkdown
	r-runit
	r-testthat
	r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=("fe0fa302356ce22204f0320f1ffb181525354aac87c7c8c6604fb61f44550e10")

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}
