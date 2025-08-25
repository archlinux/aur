# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plotROC
_pkgver=2.3.3
pkgname=r-${_pkgname,,}
pkgver=2.3.3
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
sha256sums=('8bc762647cfc3213d204d5ed7303ff4331c08e0346f0367e2e1d772accdaacde')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
