# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plotROC
_pkgver=2.3.1
pkgname=r-${_pkgname,,}
pkgver=2.3.1
pkgrel=1
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
sha256sums=('2f2c7ebec7b9cb8ad41b5ade1951b9d9f0ec12611ec369e12b10a34e5bb05b96')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
