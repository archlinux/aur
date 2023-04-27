# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cogito
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
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
sha256sums=('74d3f121471af1e6bec3beaec143878f42d9e831a8d7275fabb775c2d89c92f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
