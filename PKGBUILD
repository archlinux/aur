# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeoDiff
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('1e2fcafdd2543b53dbc39236d809a366cebece443d4dc5f45ee4d7a6b59ef437')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
