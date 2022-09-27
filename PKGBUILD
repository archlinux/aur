# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggcorrplot
_pkgver=0.1.4
pkgname=r-${_pkgname,,}
pkgver=0.1.4
pkgrel=1
pkgdesc="Visualization of a Correlation Matrix using 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-reshape2
)
optdepends=(
  r-knitr
  r-spelling
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('59829e17f6cf5ad49201c8b981e83615dfd75ea0a2b4251d11f7c6db6e05caa0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
