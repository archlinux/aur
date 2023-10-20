# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clinfun
_pkgver=1.1.5
pkgname=r-${_pkgname,,}
pkgver=1.1.5
pkgrel=1
pkgdesc='Clinical Trial Design and Data Analysis Functions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
)
optdepends=(
  r-survival
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d10699de157ed751f4dc9843b4fc03d54f66f5dc764871cdbe891d9d847c4b37')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
