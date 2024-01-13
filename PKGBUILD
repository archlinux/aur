# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kissDE
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Retrieves Condition-Specific Variants in RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ade4
  r-aods3
  r-biobase
  r-deseq2
  r-doparallel
  r-dss
  r-dt
  r-factoextra
  r-foreach
  r-ggplot2
  r-gplots
  r-matrixstats
  r-shiny
  r-shinycssloaders
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2114ecbba1a9ad67709fe03adc30f99d32d4c07949f8c561c736230228e5007f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
