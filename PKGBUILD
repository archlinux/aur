# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iC10TrainingData
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Training Datasets for iC10 Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('077ad100c88732bdefae178f52d9074a')
b2sums=('f5e4c7b7991d228f9b655541c411bfd281cefb01ba1be4159c7cbb3a8c6da9065094b65a5dcfe98119fdc9966a8a534e4efc9c96b0ebe04abf6ea1246daf3ecb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
