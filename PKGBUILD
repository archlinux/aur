# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adabag
_pkgver=4.2
pkgname=r-${_pkgname,,}
pkgver=4.2
pkgrel=4
pkgdesc='Applies Multiclass AdaBoost.M1, SAMME and Bagging'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-caret
  r-doparallel
  r-foreach
)
optdepends=(
  r-mlbench
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47019eb8cefc8372996fbb2642f64d4a91d7cedc192690a8d8be6e7e03cd3c81')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
