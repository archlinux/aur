# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recount
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Explore and download data from the recount project'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-derfinder
  r-downloader
  r-genomeinfodb
  r-genomicranges
  r-geoquery
  r-iranges
  r-rcurl
  r-rentrez
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-annotationdbi
  r-biocmanager
  r-biocstyle
  r-covr
  r-deseq2
  r-dt
  r-edger
  r-ensdb.hsapiens.v79
  r-genomicfeatures
  r-ggplot2
  r-knitr
  r-org.hs.eg.db
  r-pheatmap
  r-rcolorbrewer
  r-refmanager
  r-regionreport
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ef6037f3fccee7a3b5e823202753b3d490173ea4e401e0668af364e64976c2da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
