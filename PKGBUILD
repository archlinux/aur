# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=jackstraw
_pkgver=1.3.9
pkgname=r-${_pkgname,,}
pkgver=1.3.9
pkgrel=1
pkgdesc='Statistical Inference for Unsupervised Learning'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clusterr
  r-corpcor
  r-irlba
  r-qvalue
  r-rsvd
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a599ec3803c64884973eeab44aaf5a78ec44406ef4f536993406e4b6c90f871')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
