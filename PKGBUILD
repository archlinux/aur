# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biobtreeR
_pkgver=1.23.0
pkgname=r-${_pkgname,,}
pkgver=1.23.0
pkgrel=1
pkgdesc='Using biobtree tool from R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-httpuv
  r-httr
  r-jsonlite
  r-stringi
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3dc13bbf626cc6402ee16c7c0719696cce559741382e5f2839d071a954e2a0b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
