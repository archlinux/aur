# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vsn
_pkgver=3.76.0
pkgname=r-${_pkgname,,}
pkgver=3.76.0
pkgrel=1
pkgdesc='Variance stabilization and calibration for microarray data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-affy
  r-biobase
  r-ggplot2
  r-limma
)
optdepends=(
  r-affydata
  r-biocstyle
  r-dplyr
  r-hgu95av2cdf
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('06ce67b095f62c88d4a44b296a7d36af72e2b3ce840c4f5ab5f5b00524da645b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
