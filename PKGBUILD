# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spBayes
_pkgver=0.4-7
pkgname=r-${_pkgname,,}
pkgver=0.4.7
pkgrel=1
pkgdesc='Univariate and Multivariate Spatial-Temporal Modeling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-coda
  r-formula
  r-magic
  r-sp
)
optdepends=(
  r-mba
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('794558920a5b2042534a6d46e507fd1f1d05065d37b697693ce05be7cf242ba3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
