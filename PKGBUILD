# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=anocva
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="A Non-Parametric Statistical Test to Compare Clustering Structures"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f217a9c2c22909f0d4111c767c3ef929')
b2sums=('42c8040f98d4052f13cd0c3227ddb880311deb8fd6fa14781758a8205bbb4a320165fb39778affe9df1fa5329ed77021f3b72eb15433c692017801a458c36711')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
