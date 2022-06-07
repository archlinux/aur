# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSGFgui
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=3
pkgdesc='A shiny GUI for MSGFplus'
arch=('any')
url="https://bioconductor.org/packages/3.14/bioc/html/MSGFgui.html"
license=('GPL')
depends=(
  r
  r-msgfplus
  r-mzid
  r-mzr
  r-shiny
  r-shinyfiles
  r-xlsx
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8cf4fa4f0ece77a22ac5abba735deb37419fc15621b9ba16d964f7b297157236')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
