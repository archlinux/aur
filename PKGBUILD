# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rpart.plot
_pkgver=3.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Plot 'rpart' Models: An Enhanced Version of 'plot.rpart'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-earth
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b4e37de4696f4b99558e73a8534d8b80')
b2sums=('5d73671a7dae741ab9cf6e42880a0a80c8f0333828aeffe4e5518bae6b882a4a60163da929559a8fc90e0948233c0c5741fdc8f9f96cd2198e59a1880d1deb72')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
