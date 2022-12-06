# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=corncob
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=0.3.1
pkgrel=1
pkgdesc='Count Regression for Correlated Observations with the Beta-Binomial'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-detectseparation
  r-dplyr
  r-ggplot2
  r-magrittr
  r-numderiv
  r-optimr
  r-phyloseq
  r-scales
  r-trust
  r-vgam
)
optdepends=(
  r-covr
  r-knitr
  r-limma
  r-r.rsp
  r-rmarkdown
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4870d93c96c7b18f06672d114c617a03c2f86db3448354a4e055a3d626e23178')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
