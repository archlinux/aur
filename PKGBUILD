# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyMethyl
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Interactive visualization for Illumina methylation arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-htmltools
  r-matrixgenerics
  r-minfi
  r-rcolorbrewer
  r-shiny
)
optdepends=(
  r-biocstyle
  r-knitr
  r-minfidata
  r-shinymethyldata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('93647adc52ee598da962292c312dd026af8e36a1f32397a885b245f8416529ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
