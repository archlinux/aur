# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dqrng
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=0.3.0
pkgrel=4
pkgdesc='Fast Pseudo Random Number Generators'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
  r-bh
  r-rcpp
  r-sitmo
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4beeabfe245ce7196b07369f2a7d277cb08869ad8b45a22c6354c4cc70a39abb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
