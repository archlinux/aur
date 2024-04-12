# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Polychrome
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('884d7e7cabb5419dcda496678f310083')
b2sums=('64322dcfe3554ccbcb479bffd668410ab7ca34aa947de88c1dfde53ca99ccb6d29ace77491e911e023a9d412622f844a2c0355fe19ed9320dcb88f2381fccfe2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
