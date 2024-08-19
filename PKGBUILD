# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=rugarch
_pkgver=1.5-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Univariate GARCH Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-chron
  r-ks
  r-nloptr
  r-numderiv
  r-rcpp
  r-rsolnp
  r-skewhyperbolic
  r-spd
  r-xts
  r-zoo
)
makedepends=(
  gcc-fortran
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8b90637c6e30c41ef077abbed88aadb3')
b2sums=('e0b0431d6c85611386145c0320e752a60835a4e29e28c75f86ff51fe2b1b81fc8e6c93731eb8bae586696c3ec73e767973ccf04761cb1acd6f6f1a2a46eedd48')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
