# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=JADE
_pkgver=2.0-3
pkgname=r-${_pkgname,,}
pkgver=2.0.3
pkgrel=4
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
sha256sums=('56d68a993fa16fc6dec758c843960eee840814c4ca2271e97681a9d2b9e242ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
