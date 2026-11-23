# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svUnit
_pkgver=1.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'SciViews::R' - Unit, Integration and System Testing"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-runit
  r-spelling
  r-svgui
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2e4b6310598744a6c87ae06a0c5e353d')
b2sums=('61f7cd3208c8c81aac3fa58fdf771a2d504240ca28502d6003f23e5e98c52e00cfc10a23828e70a1c2b6aaddb0d176e834707cbe8b2b76f657e9563a90902f8f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
