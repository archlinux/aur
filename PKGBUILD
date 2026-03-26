# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=grpreg
_pkgver=3.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Regularization Paths for Regression Models with Grouped Covariates"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fcee82a4cc78d47fc26c822e953cb1d8')
b2sums=('ece685c46046d99cadc708d91cf8796aefd12a433487e5d37645cd88e1a5a7263877b2b60dab33bcbbdfee1ba50dde1f078182e1e294b73454a3cb65575d47f1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
