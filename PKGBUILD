# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bestglm
_pkgver=0.37.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Best Subset GLM and Regression Utilities"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-glmnet
  r-grpreg
  r-leaps
  r-pls
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('914b9c33e4b2a76b778d53935565ba4f')
b2sums=('64b65bf1c077bed4f87c8062d2a57c1f87fd276bc97d1472a30ba677f7ffd88615dc20de2210c5862b65b49829c1e56747019a85de3a139b1f355a1b2df9e55d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
