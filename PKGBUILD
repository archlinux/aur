# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=segmented
_pkgver=1.6-4
pkgname=r-${_pkgname,,}
pkgver=1.6.4
pkgrel=1
pkgdesc='Regression Models with Break-Points / Change-Points Estimation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('472c08ae3eb1c4e784aba45f3e745b0e946bef77c26fbb9f103fd35e1a349191')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
