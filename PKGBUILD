# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RLSeq
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='RLSeq: An analysis package for R-loop mapping data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationhub
  r-aws.s3
  r-callr
  r-caretensemble
  r-circlize
  r-complexheatmap
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggplotify
  r-ggprism
  r-pheatmap
  r-rcolorbrewer
  r-regioner
  r-rlhub
  r-rtracklayer
  r-valr
  r-venndiagram
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-covr
  r-dt
  r-futile.logger
  r-httr
  r-jsonlite
  r-kableextra
  r-kernlab
  r-knitr
  r-lintr
  r-magick
  r-mass
  r-org.hs.eg.db
  r-r.utils
  r-randomforest
  r-rcmdcheck
  r-readr
  r-rmarkdown
  r-rpart
  r-testthat
  r-tibble
  r-tidyr
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('997fb6be322ed3fc7ca33faa3a7f74f4ced1e8684bef89db18bf7cc55ab174d9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
