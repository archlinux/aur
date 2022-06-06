# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=elasticnet
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=4
pkgdesc='Elastic-Net for Sparse Estimation and Sparse PCA'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lars
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4826f1f7740a69b615c8db31b74eefa6f6a2bd4fd589f7f1aae232d00ce0ac5b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
