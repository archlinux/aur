# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Stat2Data
_pkgver=2.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Datasets for Stat2"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2e8a1f3d17a911ad7f4dd453264eac42')
b2sums=('c0d1d1b40554d19d4538bdb38d5b52b87dbe3291ddc6b56e8756c824aef335eeabcdcf3af830a13b83287c45ccb312befc18121a1d83b92cac8dea3d82057ea2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
