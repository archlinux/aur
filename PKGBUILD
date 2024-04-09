# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALS
_pkgver=0.0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Multivariate Curve Resolution Alternating Least Squares (MCR-ALS)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-iso
  r-nnls
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3aadfde3cc792b72fbf1768b3ae922ad')
b2sums=('318c1a3398566af9cf7fa1b1561ed4d53bed9590ba4b64a713a9e5deb5508715fd51c0778129e63af9ab434f97c5e59e1869b7a6fcac965caf1850cee515cabd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
