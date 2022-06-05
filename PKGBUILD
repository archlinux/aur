# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cba
_pkgver=0.2-21
pkgname=r-${_pkgname,,}
pkgver=0.2.21
pkgrel=4
pkgdesc='Clustering for Business Analytics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-proxy
)
optdepends=(
  r-colorspace
  r-gclus
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a61e787458e2df5049bea797bb442d6c86ebc9aa9b4dfbf043e23adac15d5048')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
