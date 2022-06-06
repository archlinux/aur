# system requirements: Tcl/Tk (>= 8.5), Tktable (>= 2.9, optional)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tcltk2
_pkgver=1.2-11
pkgname=r-${_pkgname,,}
pkgver=1.2.11
pkgrel=3
pkgdesc='Tcl/Tk Additions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  tk
)
optdepends=(
  r-utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ad183ae3b7190501504a0589e0b3be480f04267303e3384fef00987446a37dc5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
