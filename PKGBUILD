# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splancs
_pkgver=2.01-43
pkgname=r-${_pkgname,,}
pkgver=2.01.43
pkgrel=5
pkgdesc='Spatial and Space-Time Point Pattern Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sp
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b351565e1f69f6c86a29d921d3a18d5896c4586e2ab8c73bb3df8e75630fc448')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
