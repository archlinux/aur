# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enrichR
_pkgver=3.4
pkgname=r-${_pkgname,,}
pkgver=3.4
pkgrel=1
pkgdesc="Provides an R Interface to 'Enrichr'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-curl
  r-ggplot2
  r-httr
  r-rjson
  r-writexls
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('56b16625c2c05afe6bb63b68ec06d94e9511f1532fae194e64d624f2c338843e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
