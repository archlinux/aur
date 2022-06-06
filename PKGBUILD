# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppZiggurat
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=0.1.6
pkgrel=3
pkgdesc="'Rcpp' Integration of Different "Ziggurat" Normal RNG Implementations"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcppgsl
)
optdepends=(
  r-knitr
  r-lattice
  r-microbenchmark
  r-pinp
  r-rbenchmark
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9c78255ca476c945c05a564d1e4da363de714d890e0e27f3b252fd73c50eed71')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
