# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnlasso
_pkgver=0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Non-Negative Lasso and Elastic Net Penalized Generalized Linear Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e450efa4bc9b9ca55fb60e8f4ba6d5de')
b2sums=('840c7e17ed2b434139e2a688bddb270ec13dd0c3b7d0517b8a629c1994d12b89c53ec4c49ab5771337bc4cd5ad01fef9fc064f40df8a7554a83b28f730a6e26c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
