# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nsprcomp
_pkgver=0.5.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Non-Negative and Sparse PCA"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2a10abde049fdcd04c30c1a4dc3409c3')
b2sums=('547d0d059739b8d476278df82967bd3ac89b90f7e3e0bca7d20c708726ee59da165e9ca6e8703e99fbb840bc97801bf3d2d0c6aadbbae9e278c1e79028f90e80')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
