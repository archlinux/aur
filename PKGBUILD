# system requirements: C++17
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rfast
_pkgver=2.0.7
pkgname=r-${_pkgname,,}
pkgver=2.0.7
pkgrel=1
pkgdesc='A Collection of Efficient and Extremely Fast R Functions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
  r-rcppziggurat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8f86159a4760a7124e1c91ae0b022c7e496f81590ea4e4af702bea44e8dedf8f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
