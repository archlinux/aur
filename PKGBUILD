# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=apcluster
_pkgver=1.4.10
pkgname=r-${_pkgname,,}
pkgver=1.4.10
pkgrel=4
pkgdesc='Affinity Propagation Clustering'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a214f72fa2f84563f3ca1aabb5322ef3e266007a6273ee8434bc2e2a7b9040a0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
