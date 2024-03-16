# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svGUI
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="SciViews - Manage GUIs in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-covr
  r-knitr
  r-markdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f6b7f275fda2066db762a0d1791ec56')
b2sums=('70fd0ad048d79f79a417119a3b7dabf7081aab339aa79004c1cf16c702fc891552693e66985e03e6b642a0131cc9d074af1007ad8e60ca6e4bbc79eb1e7deff8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
