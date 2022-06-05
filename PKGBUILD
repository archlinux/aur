# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bayesm
_pkgver=3.1-4
pkgname=r-${_pkgname,,}
pkgver=3.1.4
pkgrel=4
pkgdesc='Bayesian Inference for Marketing/Micro-Econometrics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('061b216c62bc72eab8d646ad4075f2f78823f9913344a781fa53ea7cf4a48f94')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
