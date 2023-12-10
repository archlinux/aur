# system requirements: gmp (>= 4.2.3), mpfr (>= 3.0.0) | file README.md
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PMCMRplus
_pkgver=1.9.10
pkgname=r-${_pkgname,,}
pkgver=1.9.10
pkgrel=1
pkgdesc='Calculate Pairwise Multiple Comparisons of Mean Rank Sums Extended'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bwstest
  r-gmp
  r-ksamples
  r-multcompview
  r-mvtnorm
  r-rmpfr
  r-suppdists
  mpfr
  gmp
)
optdepends=(
  r-car
  r-e1071
  r-graphics
  r-knitr
  r-multcomp
  r-nsm3
  r-pwr
  r-rmarkdown
  r-xtable
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d883f897fa26a0bca0ba464dac7b360c6adee2c7867097e91fc7588030ed1f70')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
