# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=PlotTools
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=0.3.0
pkgrel=1
pkgdesc='Add Continuous Legends to Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sp
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6fbe19c9c8ab1696abb69d74671091bfb5fe13ee16cd302bd39de8b78266a3d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
