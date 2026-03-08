# system requirements: SVMlight
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=klaR
_pkgver=1.7-4
pkgname=r-${_pkgname,,}
pkgver=1.7.4
pkgrel=1
pkgdesc='Classification and Visualization'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-combinat
  r-questionr
)
optdepends=(
  r-clustmixtype
  r-clustvarlv
  r-e1071
  r-mlbench
  r-randomforest
  r-rpart
  r-scatterplot3d
  r-som
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3488b3118960234bb17dbd8936be0599f769cb86dc3c324786fd397880307f0e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
