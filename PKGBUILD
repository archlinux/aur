# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FactoMineR
_pkgver=2.4
pkgname=r-${_pkgname,,}
pkgver=2.4
pkgrel=3
pkgdesc='Multivariate Exploratory Data Analysis and Data Mining'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-dt
  r-ellipse
  r-flashclust
  r-ggplot2
  r-ggrepel
  r-leaps
  r-scatterplot3d
)
optdepends=(
  r-factoshiny
  r-knitr
  r-markdown
  r-missmda
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b9e3adce9a66b4daccc85fa67cb0769d6be230beeb126921b386ccde5db2e851')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
