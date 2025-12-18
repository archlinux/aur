# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfittext
_pkgver=0.10.3
pkgname=r-${_pkgname,,}
pkgver=0.10.3
pkgrel=1
pkgdesc="Fit Text Inside a Box in 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gridtext
  r-shades
  r-stringi
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('45cf2ea5faef8d6366b6d672617d8bdc73d6e7a14ebc9dce2b277f9c9d2cd5df')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
