# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scatterpie
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=0.2.2
pkgrel=1
pkgdesc='Scatter Pie Plot'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-ggforce
  r-ggfun
  r-ggplot2
  r-rlang
  r-tidyr
)
optdepends=(
  r-knitr
  r-maps
  r-prettydoc
  r-rmarkdown
  r-scales
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c21086d14c24106978222ac00f2621e20f3fb8f4ab6785a5d53ebf87b37966e0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
