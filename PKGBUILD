# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Gviz
_pkgver=1.44.2
pkgname=r-${_pkgname,,}
pkgver=1.44.2
pkgrel=1
pkgdesc='Plotting data and annotation information along genomic coordinates'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biomart
  r-biostrings
  r-biovizbase
  r-bsgenome
  r-digest
  r-ensembldb
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-latticeextra
  r-matrixstats
  r-rcolorbrewer
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-xvector
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4414d2842f5fd8fd0793e689923814172e4752086e971cd09b9fce897cd55151')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
