# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plotROC
_pkgver=2.3.0
pkgname=r-${_pkgname,,}
pkgver=2.3.0
pkgrel=3
pkgdesc='Generate Useful ROC Curve Charts for Print and Interactive Use'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-ggplot2
  r-gridsvg
  r-plyr
  r-rlang
  r-shiny
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-stringr
  r-survivalroc
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ef0c0937f28df4512c2c0a53ef9b2b2ffbc4667a8abae3d8892fc51a334c5f4d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
