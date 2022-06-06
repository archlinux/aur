# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FNN
_pkgver=1.1.3.1
pkgname=r-${_pkgname,,}
pkgver=1.1.3.1
pkgrel=3
pkgdesc='Fast Nearest Neighbor Search Algorithms and Applications'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-chemometrics
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('52b0e20611481a95bced40be4126f44b002fd3a9c4c9674bb34db4e1e3b5be5a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
