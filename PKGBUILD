# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=blockmodeling
_pkgver=1.1.3
pkgname=r-${_pkgname,,}
pkgver=1.1.3
pkgrel=1
pkgdesc='Generalized and Classical Blockmodeling of Valued Networks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-doparallel
  r-dorng
  r-foreach
  r-sna
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5f705f92c9b96dcbdd6f109c6a99f88d70c576485369700b82391b6a75afbda6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
