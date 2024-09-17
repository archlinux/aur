# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=EBMAforecast
_pkgver=1.0.32
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Estimate Ensemble Bayesian Model Averaging Forecasts using Gibbs Sampling or EM-Algorithms'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-glue
  r-gtools
  r-hmisc
  r-plyr
  r-rcpp
  r-separationplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('24be367219899637527914ffbabe6c2f555f1e5484e3fae8c7806ad0c641fb06')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
