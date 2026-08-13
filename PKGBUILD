# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=rugarch
_pkgver=1.5-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Univariate GARCH Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-chron
  r-fracdiff
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
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c429d69d4057608be01cdc495c3d00e')
b2sums=('d5273111c22e8fd2b6fdae0cafa1c946ee53bfa720a5cacd49b90d64870d5bd052f345808493449266ea271bd7406409f4ef07833bc4f4c4fad77524fef6f76c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
