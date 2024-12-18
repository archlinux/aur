# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cogito
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Compare genomic intervals tool - Automated, complete, reproducible and clear report about genomic and epigenomic data sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-annotationdbi
  r-biocmanager
  r-entropy
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-jsonlite
  r-magrittr
  r-rmarkdown
  r-s4vectors
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7aa6bc71d99bcd9c10a7bb4c270fc4b891f6005c2dc4db3451f5061f95380560')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
