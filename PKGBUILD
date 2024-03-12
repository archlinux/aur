# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NbClust
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Determining the Best Number of Clusters in a Data Set"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('797acb196fb81f0859acd43f08072546')
b2sums=('e3eab8fa8664689045d4ed9d83855774e5c70613e1ea8e3375e439e399a24293c9490e14212684a3adc4ce60398b0ade7f8d69d2c5cf4f66466fee330815ae3e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
