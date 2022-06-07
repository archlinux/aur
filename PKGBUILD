# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=taRifx
_pkgver=1.0.6.2
pkgname=r-${_pkgname,,}
pkgver=1.0.6.2
pkgrel=4
pkgdesc='Collection of Utility and Convenience Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-plyr
  r-reshape2
)
optdepends=(
  r-catools
  r-data.table
  r-gdata
  r-ggplot2
  r-grid
  r-lattice
  r-pspline
  r-rsqlite
  r-stringr
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('89d031db00a94ae57c7ace0d9aa39ba2f960f96fd48d2d1e4c7ebb62a2969b15')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
