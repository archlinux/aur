# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExpressionAtlas
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('92905878d4144ddc9daaf3f1671370381b18f04d3cce12ba1de3626c00a322ef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
