# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeDate
_pkgver=4021.104
pkgname=r-${_pkgname,,}
pkgver=4021.104
pkgrel=1
pkgdesc='Rmetrics - Chronological and Calendar Objects'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-date
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('03ee76e87162cf97f6e63714af107f83abb385b424a98b34a13cbe98d87acc0e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
