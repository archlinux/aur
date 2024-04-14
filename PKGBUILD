# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reportr
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="A General Message and Error Reporting System"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-ore
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3c6c8d1d2d67492808f1c6327c20e109')
b2sums=('638c1f9fffff8839185ee2c70b4f8246c0f694502044a76cebe895c9df43d24d34bfda1b0a7479bc2821d64a4f46f8d4972c25bc027e648e8f35cae6410d7fa6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
