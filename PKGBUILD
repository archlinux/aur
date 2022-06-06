# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PRROC
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=4
pkgdesc='Precision-Recall and ROC Curves for Weighted and Unweighted Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-rocr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('479118ce47c527bc97fb58d531a31cabc094d9843d62f16922009dc62e8248d4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
