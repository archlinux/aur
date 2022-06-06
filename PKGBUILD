# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enrichR
_pkgver=3.0
pkgname=r-${_pkgname,,}
pkgver=3.0
pkgrel=4
pkgdesc="Provides an R Interface to 'Enrichr'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-httr
  r-rjson
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('43f9b7f66f76fde41bd24781e4df7a2632b4e341aec81f8c3da4d7e908767344')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
