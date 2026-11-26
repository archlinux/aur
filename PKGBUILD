# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=poilog
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Poisson Lognormal and Bivariate Poisson Lognormal Distribution"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0d8a1d86070922cf415ca34a23b304c9')
b2sums=('4e9391183502a088b5d74e12ec5d7b7d443bed9714c18112f9f70f58fe0f42b1ec1338d1d4b36afe9db1e109fda8eaee0d4a1d21165bd674ce791ccd19d54a55')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
