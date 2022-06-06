# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mpm
_pkgver=1.0-23
pkgname=r-${_pkgname,,}
pkgver=1.0.23
pkgrel=3
pkgdesc='Multivariate Projection Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d2abda28246842b187b796a730c6e0590182960fda3bbf16ce4a1d5e5b13fbca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
