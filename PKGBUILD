# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=grpreg
_pkgver=3.5.0
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
md5sums=('09e2b34ff9e966557cd73ffa2bcfaab2')
b2sums=('33247af5784d3dc2c85096f3af45e80fef5990e9ddb66e2b0426c112e16a3f92e71ee76a67055675c8b313a3e8f61faf62d8e66de57dd198cd96e6d10a6654d0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
