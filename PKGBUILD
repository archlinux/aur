# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svUnit
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="'SciViews' - Unit, Integration and System Testing"
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
  r-runit
  r-spelling
  r-svgui
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e8f7bd4037adb70a469f3076f8015e91')
b2sums=('d42f74f6dcee8c99ff2cb5456f61cae4d481872e1e42a837c520e204fb146849949d2cb1681d5ab0253f639ff1b8f62fc418ae3a6f86e8de2eb9e06a791ce7fa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
