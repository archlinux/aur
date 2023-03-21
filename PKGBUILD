# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTCGAToolbox
_pkgver=2.28.1
pkgname=r-${_pkgname,,}
pkgver=2.28.1
pkgrel=1
pkgdesc='A new tool for exporting TCGA Firehose data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL2')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-delayedarray
  r-genomeinfodb
  r-genomicranges
  r-httr
  r-limma
  r-raggedexperiment
  r-rcircos
  r-rcurl
  r-rjsonio
  r-rvest
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tcgautils
  r-xml
)
optdepends=(
  r-biocstyle
  r-homo.sapiens
  r-knitr
  r-readr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('629b6f8b8d465251f2b7974fb7caed60827c817021ddbfcc85a74614156cc2f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
