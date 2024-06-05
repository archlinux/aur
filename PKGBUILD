# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scatterpie
_pkgver=0.2.3
pkgname=r-${_pkgname,,}
pkgver=0.2.3
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
sha256sums=('704f1072ff934729aefdd659e5c81e62b59f5ae94dc36a1e1f52085dce896447')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
