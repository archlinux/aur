# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aod
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=1.3.3
pkgrel=1
pkgdesc='Analysis of Overdispersed Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-boot
  r-lme4
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b7245e8abf7d78cdfa7f74f6d90f79a418b883058aa3edd5977a60bdbed4087e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
