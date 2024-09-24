# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spBayes
_pkgver=0.4-8
pkgname=r-${_pkgname,,}
pkgver=0.4.8
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
sha256sums=('0d2e1f7ab859b6f6ff2b386709382fb953cad6b6295ac93ff07396e9145f569e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
