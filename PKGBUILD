# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Polychrome
_pkgver=1.6.2
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
md5sums=('8f2440e05acdfa4aa3ed19c5d0d9bcd9')
b2sums=('44cead3f3101eb2a93f519c6e874a035c99d015197296ec9d658c0afbbaa081656f9d3aa7c851732f24e53bb84e19058c5175b8b758398dafa864a3d909ef015')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
