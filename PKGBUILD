# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bayesm
_pkgver=3.1-6
pkgname=r-${_pkgname,,}
pkgver=3.1.6
pkgrel=1
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
sha256sums=('17d72b9cdc090845f98e7a04640380d0baef8bc23d1487c8f64dc192fdb93cb5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
