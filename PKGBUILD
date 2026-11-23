# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FactoMineR
_pkgver=2.18
pkgname=r-${_pkgname,,}
pkgver=2.18
pkgrel=1
pkgdesc='Multivariate Exploratory Data Analysis and Data Mining'
arch=('x86_64')
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
  r-irlba
  r-scales
  r-showtext
  r-sysfonts
)
optdepends=(
  r-factoshiny
  r-knitr
  r-markdown
  r-missmda
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('10fcdde8f685c30c2403e1037c3ccc3a35bddf1090e11d346a8bf20964c55f8e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
