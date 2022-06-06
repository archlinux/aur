# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=grr
_pkgver=0.9.5
pkgname=r-${_pkgname,,}
pkgver=0.9.5
pkgrel=4
pkgdesc='Alternative Implementations of Base R Functions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('292606de2983ac5840c90d3e0977441b482c9e73c1674b662f8b4fb8f3632b2b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
