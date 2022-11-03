# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SGSeq
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Splice event prediction and quantification from RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biostrings
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-igraph
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-runit
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cc7317015ed6997d810516bc6b4400c42d1f325b86287eb2280be3772bf8ad0d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
