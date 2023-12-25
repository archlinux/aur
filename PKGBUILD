# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qualV
_pkgver=0.3-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Qualitative Validation Methods"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f10824912626d65fc1fe53fbccc40807')
b2sums=('94d7aa691738c0d123d63e10270dcf3e68c839e89bd0e222d2fd63bc884c79721723c354a512b0d32d075797a3dd0703d6c8b3a1cc862a04347c3fcca48bee8f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
