# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MuMIn
_pkgver=1.48.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Multi-Model Inference"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-insight
)
optdepends=(
  r-gamm4
  r-geepack
  r-lme4
  r-performance
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2df3a28a9214d4f926a4ef1fa7f98143')
b2sums=('e3c62139d5e915d47e3fb16877fb905d8922301a50cd7c1b6230400ff4899ee9ee8e298b096f987a2a0767cebddac02ee0bd5ada2decdaaa50ace8cd7df27c57')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
