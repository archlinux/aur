# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=clusterGeneration
_pkgver=1.3.7
pkgname=r-${_pkgname,,}
pkgver=1.3.7
pkgrel=1
pkgdesc='Random Cluster Generation (with Specified Degree of Separation)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('534f29d8f7ed11e6e9a496f15845b588ec7133f3da5e6def8140b88500e52d5c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
