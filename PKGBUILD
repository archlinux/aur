# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=apcluster
_pkgver=1.4.14
pkgname=r-${_pkgname,,}
pkgver=1.4.14
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
sha256sums=('dac14db3b5d2d165537b14d4082cb004563474d406d13abd2ac0fbcac4063942')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
