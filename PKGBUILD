# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EpiDISH
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=2.16.0
pkgrel=1
pkgdesc='Epigenetic Dissection of Intra-Sample-Heterogeneity'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-e1071
  r-locfdr
  r-matrixstats
  r-quadprog
  r-stringr
)
optdepends=(
  r-biobase
  r-biocstyle
  r-geoquery
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9b036c4a52d5c6b45acaeaad1978ca7ccc6cfc27cbc07fd10a54ceaaae8c4803')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
