# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=jackstraw
_pkgver=1.3.8
pkgname=r-${_pkgname,,}
pkgver=1.3.8
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
sha256sums=('897146888be7f7962a038939fa88005de729f4fcbf4291f6577d59f456cca011')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
