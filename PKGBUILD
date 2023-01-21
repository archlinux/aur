# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeoDiff
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=1.4.2
pkgrel=1
pkgdesc='Count model based differential expression and normalization on GeoMx RNA data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-geomxtools
  r-lme4
  r-nanostringnctools
  r-plyr
  r-rcpp
  r-rcpparmadillo
  r-robust
  r-roptim
  r-testthat
  r-withr
)
optdepends=(
  r-dplyr
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8193dc3aa63c3393391e3f67d82b2b67a1ab462cb0dbf516235ebced22f1ac19')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
