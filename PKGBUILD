# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=heatmap3
_pkgver=1.1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="An Improved Heatmap Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-fastcluster
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0bf9e7c9efab40a20f20871c91867bf4')
b2sums=('44f1aea550d5b6d9d2949a4c7c6df0d915d47a320ad29c9584fd8dcb9ebb6021e9bcc5e80e0f7b92f03559e79e210e9726b130c97ed11a3a59960076b38f9187')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
