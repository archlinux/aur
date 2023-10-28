# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=regionReport
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Generate HTML or PDF reports for a set of genomic regions or DESeq2/edgeR results'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocstyle
  r-deformats
  r-derfinder
  r-deseq2
  r-genomeinfodb
  r-genomicranges
  r-knitr
  r-knitrbootstrap
  r-refmanager
  r-rmarkdown
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocmanager
  r-biovizbase
  r-bumphunter
  r-derfinderplot
  r-dt
  r-edger
  r-ggbio
  r-ggplot2
  r-grid
  r-gridextra
  r-iranges
  r-mgcv
  r-pasilla
  r-pheatmap
  r-rcolorbrewer
  r-sessioninfo
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-whisker
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('676e65645afe51b9d5c639529fc0f5d1f16ee90ef3c4fd5322e76c67cc4c71da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
