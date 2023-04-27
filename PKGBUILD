# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=derfinder
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Annotation-agnostic differential expression analysis of RNA-seq data at base-pair resolution via the DER Finder approach'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biocparallel
  r-bumphunter
  r-derfinderhelper
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-hmisc
  r-iranges
  r-qvalue
  r-rsamtools
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-covr
  r-derfinderdata
  r-derfinderplot
  r-deseq2
  r-ggplot2
  r-knitr
  r-limma
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9ce51ed8014ab050524fb5fc9b50df6ca598fe20f3f1a7a505d63923262c66bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
