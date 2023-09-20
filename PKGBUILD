# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=apcluster
_pkgver=1.4.11
pkgname=r-${_pkgname,,}
pkgver=1.4.11
pkgrel=1
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
sha256sums=('4497da8766802cb18a5729ddb629368a17a967436d696941deb4b21da73e3333')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
