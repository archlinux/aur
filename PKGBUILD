# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=JADE
_pkgver=2.0-4
pkgname=r-${_pkgname,,}
pkgver=2.0.4
pkgrel=1
pkgdesc='Blind Source Separation Methods Based on Joint Diagonalization and Some BSS Performance Criteria'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clue
)
optdepends=(
  r-ics
  r-icsnp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d4b3d65a33cae454d3ab13343bceabfb3f6b8004ac64ae7bd86dee92a1cd2055')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
