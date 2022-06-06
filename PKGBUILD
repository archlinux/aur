# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=smoother
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=1.1
pkgrel=4
pkgdesc='Functions Relating to the Smoothing of Numerical Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ttr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('91b55b82f805cfa1deedacc0a4e844a2132aa59df593f3b05676954cf70a195b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
