# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MuMIn
_pkgver=1.48.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('7ebbdfbc2246f40d247675d77037acfc')
b2sums=('97e20b8d735caa75aa96c50b93304c8944be8c9c899cf299af516a39a5928b3c4ad795206bd9e0a02cdd80145946694dfc5de9adfde19fa9566965dd00b4ad27')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
