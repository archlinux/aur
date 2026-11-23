# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wheatmap
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Incrementally Build Complex Plots using Natural Semantics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-colorspace
  r-gtable
  r-pals
  r-rcolorbrewer
)
optdepends=(
  r-knitr
  r-png
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('95e3b220b3975069850adcd77258c6dd')
b2sums=('f8ddd5070809473716bd0eed8c546f94462fba855b10324a6cae6f32087d90e5c2bc1e89aa468ee8a2fbde26db1871720efd4d181eb3fdc0e6e8b1071f6657ff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
