# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rDGIdb
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='R Wrapper for DGIdb'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-httr
  r-jsonlite
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e0a094fb66c5c055d25567a81340babc729a5e6645480055cc6828b8769ff887')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
