# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parmigene
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Parallel Mutual Information Estimation for Gene Network Reconstruction"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b4e0213cf464ca63b6dc51f3133c975a')
b2sums=('f4122c712bed369e60bb9771b2a0225c6a09bb0bcae66f8435e98415406029b7459738c07ac0e457e8841e37690778f8f6dece376893531bb372662653039ab0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
