# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FactoMineR
_pkgver=2.6
pkgname=r-${_pkgname,,}
pkgver=2.6
pkgrel=1
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
  r-multcompview
  r-emmeans
)
optdepends=(
  r-factoshiny
  r-knitr
  r-markdown
  r-missmda
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('81261608c097b863e004a0c6cdc4bdfd6e7bf49c6ec20e211233eda2e5268f75')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
