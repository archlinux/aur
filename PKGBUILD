# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=rugarch
_pkgver=1.5-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Univariate GARCH Models"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
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
md5sums=('98d9cb00c50db386ca21f716656df2b6')
sha256sums=('9ffe510807ebafaa689a357c10df3523e3231b473b3eae18783f528c1577de1e')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
