# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExpressionAtlas
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Download datasets from EMBL-EBI Expression Atlas'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocstyle
  r-httr
  r-jsonlite
  r-limma
  r-rcurl
  r-s4vectors
  r-summarizedexperiment
  r-xml
  r-xml2
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3467cc5d6aa405f2865a6ea7ad52c85a3146d455d292bbfe90ddef30134bba48')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
