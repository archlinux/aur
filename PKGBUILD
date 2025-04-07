# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Polychrome
_pkgver=1.5.4
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
md5sums=('c4dba742d377b1422aa078012432dcbd')
b2sums=('03f801f0486bba6293a75af909187dcee518d9dd16f759f0ed9e7a6ed64a4bc2ebd6701acc713fbe385e68361713f7cbe059092c4a81637e56f79528f248599a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
