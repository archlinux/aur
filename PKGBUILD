# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=skmeans
_pkgver=0.2-14
pkgname=r-${_pkgname,,}
pkgver=0.2.14
pkgrel=4
pkgdesc='Spherical k-Means Clustering'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-clue
  r-slam
)
optdepends=(
  r-kmndirs
  r-matrix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('18eb6d8e10a41ca6ee3ae34df7e2fb38f4f11e96e0a1db41c16386c9db4f77ce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
