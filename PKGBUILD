# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Matching
_pkgver=4.10-15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multivariate and Propensity Score Matching with Balance Optimization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-rgenoud
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e1583843b72a115244267dbaa1a1c4c6')
b2sums=('404cc7df93450020ff7fc643f4844a4074dea8dd017d37597d1ee6da08fac2625a6fbaeea5b9bcfd2efadb093b2e867eb895f4b39ebbe917d0c1bc0c529fbba8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
