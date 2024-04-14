# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iC10
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="A Copy Number and Expression-Based Classifier for Breast Tumours"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ic10trainingdata
  r-impute
  r-pamr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('90248cbd2eb992ff818b02820db3dc7d')
b2sums=('91b541ed3bbb23977a36df619657052d0012e051db5c4df36e6141e493443606ade5d9cc730c42630c405d48fb07245b81505ec00621bc75ce11d3e180508ed4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
