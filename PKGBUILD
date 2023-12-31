# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rpart.plot
_pkgver=3.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Plot 'rpart' Models: An Enhanced Version of 'plot.rpart'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  r
)
optdepends=(
  r-earth
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5107258efdc312dfe709fa98babc1629')
b2sums=('66ccb9562cbadd1352d44728d884dee6ff2aaec165d5bb9afe08f32bc04fb700c2c273a587b9f460be66ab419cc074e55479bbe852d3befc8cb0229af1883026')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
