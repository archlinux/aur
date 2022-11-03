# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=covEB
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Empirical Bayes estimate of block diagonal covariance matrices'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-gsl
  r-igraph
  r-laplacesdemon
  r-mvtnorm
)
optdepends=(
  r-curatedbladderdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bedb7f3501583a85363de76f0b92464a2759c671e44cc4cbd7dbbd6a010675a6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
