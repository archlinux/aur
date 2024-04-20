# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=apcluster
_pkgver=1.4.12
pkgname=r-${_pkgname,,}
pkgver=1.4.12
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
sha256sums=('857dee9ea2b5f55e666a44037fd7ba1a7bd8e867b4eeda945acc93949bd04407')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
