# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simpleCache
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
pkgrel=4
pkgdesc='Simply Caching R Objects'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
optdepends=(
  r-batchtools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f129c43fa648a882fba3798b0b9e710f9e74b717bcbc9be7e1d30862cc15e7d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
