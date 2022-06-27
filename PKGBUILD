# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FField
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=0.1.0
pkgrel=6
pkgdesc='Force field simulation for a set of points'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-gridextra
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('18c5fbcf3f7c9151ee528df3be1156febf5d3f6fc650e1ec829898bdc5360117')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
