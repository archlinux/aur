# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PolynomF
_pkgver=2.0-5
pkgname=r-${_pkgname,,}
pkgver=2.0.5
pkgrel=1
pkgdesc='Polynomials in R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a86f7a8c768c9361a5203a7152532a39e038800f6db9b49b8591c8e2de135b2b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
