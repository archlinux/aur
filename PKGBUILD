# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=venn
_pkgver=1.13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Draw Venn Diagrams"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-admisc
)
optdepends=(
  r-ggplot2
  r-ggpolypath
  r-qca
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('44c5bd5c273f64b7f9884a02582f23b7')
b2sums=('46114ec506aa9cd48592e86960f8142468505fd3e678eeed0b359a7bb541cf73378bfce14718f796b9fe7de77ec49d9dad763bfcacb5d1df9ffcb724b551d455')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
