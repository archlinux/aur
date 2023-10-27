# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rGREAT
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
pkgrel=1
pkgdesc='Client for GREAT Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-circlize
  r-digest
  r-doparallel
  r-dt
  r-foreach
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-getoptlong
  r-globaloptions
  r-go.db
  r-iranges
  r-org.hs.eg.db
  r-progress
  r-rcolorbrewer
  r-rcpp
  r-rcurl
  r-rjson
  r-s4vectors
  r-shiny
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
optdepends=(
  r-biocmanager
  r-biomartgogenesets
  r-keggrest
  r-knitr
  r-msigdbr
  r-org.mm.eg.db
  r-reactome.db
  r-rmarkdown
  r-testthat
  r-uniprotkeywords
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('22281d1420cb3068c06e27e4f1535fd10160052da804a9fae28eabada2abdb25')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
