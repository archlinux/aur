# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rasterVis
_pkgver=0.51.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization Methods for Raster Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-hexbin
  r-latticeextra
  r-raster
  r-rcolorbrewer
  r-sp
  r-terra
  r-viridislite
  r-zoo
)
optdepends=(
  r-colorspace
  r-dichromat
  r-ggplot2
  r-rgl
  r-sf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c31585f2f4c883fdc687e9cd0a4c7ea')
b2sums=('d461e684115b523d601c9eb3583888614deda310c0e2dc6d94c85c4357804fe306ef763b039e5acec90741267f7a290aed023468c6aaa71ac34f45d4bfdf20c5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
