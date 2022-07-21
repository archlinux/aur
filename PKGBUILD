# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chron
_pkgver=2.3-57
pkgname=r-${_pkgname,,}
pkgver=2.3.57
pkgrel=1
pkgdesc='Chronological Objects which can Handle Dates and Times'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-scales
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9645d86a84d1afc12a0accf4f826fdd40e6d050a313424ad70f8085e8f19c232')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
