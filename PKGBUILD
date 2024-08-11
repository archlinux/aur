# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Stat2Data
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Datasets for Stat2"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9716c4c61a593a257824b4096ec9c2f9')
b2sums=('1a743f6a054cc664f3d92099d7c00e0676e41530101c22b010a34f13eb463baf5b6efabc659554c69dfde31806e0ae8055fe8a75a95ed11c39a917a3c331e627')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
