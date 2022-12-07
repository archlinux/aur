# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cba
_pkgver=0.2-23
pkgname=r-${_pkgname,,}
pkgver=0.2.23
pkgrel=1
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
sha256sums=('d698b0001a2f14a1e8afce0960b04b5bfbe4617f3068429f81020fbbd52c54a1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
