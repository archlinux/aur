# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rasterVis
_pkgver=0.51.6
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
md5sums=('9e0a042f2e7058b73b32e8207fdbfd74')
b2sums=('fa3e9629e42727102cbff7b1c76fb3ace380be049a766e534055f63c182dad0726279e3a3f5b6c24a9f171a58e49b0a37bbdf2f166ada1d75a9a342397d168f3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
