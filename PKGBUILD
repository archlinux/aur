# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiasedUrn
_pkgver=2.0.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Biased Urn Model Distributions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7283f3ef0b174580f7b612f3c9d37978')
b2sums=('f2af2dee12579a13e01cb59e71a24498cf2bc2956faf44da0683afcbfe67175effc7bd4f09027c57672e24fa55b2c4a69127bae73b42c0b1c6246bee893edcf4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
