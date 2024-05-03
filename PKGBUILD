# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyMethyl
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
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
sha256sums=('ba3d7ff9b84db9352eebe2f4bdf64ccf28e0dc47192e1d7ddcb2298a5de82997')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
