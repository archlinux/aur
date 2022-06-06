# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=objectSignals
_pkgver=0.10.3
pkgname=r-${_pkgname,,}
pkgver=0.10.3
pkgrel=3
pkgdesc='objectSignals'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2d766beade3b0c914f0cd3d4c77ede2d80d87fe2787dd57eeef80f0ebb9df020')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
