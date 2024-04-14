# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svDialogs
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="'SciViews' - Standard Dialog Boxes for Windows, MacOS and Linuxes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rstudioapi
  r-svgui
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
  yad
  zenity
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('221117c06ec3a116d6c55d6b6c104334')
b2sums=('4a8fe472d9adee3684cba3c11a76ac8ca3725a3d60a75dbe1dd4e24619131cb6298ca3f38c78e9b67718c957e485568e881bfe5289a5734e87f96483da17b927')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
