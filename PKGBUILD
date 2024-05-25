# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=googleVis
_pkgver=0.7.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to Google Charts"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-jsonlite
)
optdepends=(
  r-data.table
  r-httpuv
  r-knitr
  r-markdown
  r-rmarkdown
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bbd9349617e56abd1513a73f4238af09')
b2sums=('89cc4b20e369356bd0d6b3ea727f5f4d797268612e476f88fee12c62db145e6780ffd4927af9e0a02b2a0540ee4631fdea8b9e54d0dff954e8bbbb3d188c896b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
