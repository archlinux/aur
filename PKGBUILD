# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=itertools
_pkgver=0.1-3
pkgname=r-${_pkgname,,}
pkgver=0.1.3
pkgrel=4
pkgdesc='Iterator Tools'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-iterators
)
optdepends=(
  r-foreach
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b69b0781318e175532ad2d4f2840553bade9637e04de215b581704b5635c45d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
