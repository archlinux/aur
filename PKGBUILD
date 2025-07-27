# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rpart.plot
_pkgver=3.1.3
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
md5sums=('81229950848d7792cc89def81aa4a9da')
b2sums=('60fb9fa1ad37615bee4ce910b87b8d705c22d0092a554349a88265fb841094486896d25d2a67abd49a38fae346cd009d23d25c60aea234cc834cbdbbc6ded2a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
