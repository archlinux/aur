# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsvd
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Randomized Singular Value Decomposition"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bc70b3952782a178c5b109f4351e1e3b')
b2sums=('27d57a4eeccd4757c164f34c8f0dcdb92b02b0f0f2096b36a6306fbd87f729b958666ea9267e42365a31740e811ca5f36bcef84da3c3fc63dbb8185542c37225')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
