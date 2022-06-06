# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DrImpute
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=1.0
pkgrel=4
pkgdesc='Imputing Dropout Events in Single-Cell RNA-Sequencing Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-devtools
  r-irlba
  r-knitr
  r-rmarkdown
  r-roxygen2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6b88b44cf3d8e4d626295955dd950d8ddf9c2ed7d88bfef015482ccc7356bfa9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
