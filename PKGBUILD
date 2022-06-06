# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsubfn
_pkgver=0.7
pkgname=r-${_pkgname,,}
pkgver=0.7
pkgrel=4
pkgdesc='Utilities for Strings and Function Arguments'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-proto
)
optdepends=(
  r-boot
  r-chron
  r-grid
  r-lattice
  r-quantreg
  r-svunit
  r-tcltk
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('89351df9e65722d2862f26a0a3985666de3c86e8400808ced8a6eb6e165a4602')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
