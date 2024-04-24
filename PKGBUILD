# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mpm
_pkgver=1.0-23
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Multivariate Projection Methods"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea7caeb175b39373b21f931aa6f4de9d')
b2sums=('e83b2095223a6a5cb9c00a5570c007c266a08b2ba1132ef7490ae3c5af82e2e07e759dee630ff4ecdcc50c58fa2409411d29ba0aa157f670ee3867356c79bb7a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
