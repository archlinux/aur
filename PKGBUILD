# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Polychrome
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Qualitative Palettes with Many Colors"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-colorspace
  r-scatterplot3d
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('13e1466091caa778cc53d1bce5dbcc62')
b2sums=('224a9c6b87a1d67ee3a6594555499c0617465249a82fda9f7e11604484830d1a268133ae8f20e7e622c3a862f4a6f96bfcd1fc08d6c85955866a327aee3e0dd5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
