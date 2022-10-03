# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RobustRankAggreg
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=1.2
pkgrel=1
pkgdesc='Methods for robust rank aggregation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a40a50f1ef72b296214df038391971bb861744df681b67f94c22220a24ab89d4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
