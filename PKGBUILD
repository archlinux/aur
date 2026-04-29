# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BufferedMatrixMethods
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microarray Data related methods that utlize BufferedMatrix objects"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-bufferedmatrix
)
optdepends=(
  r-affy
  r-affyio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df68e6773383f41216478882748d91de')
b2sums=('88f5c667ae44dce868fb8b38314618392dd72d595e6545d2f07fcad1f7b49f0c2fb991960820effb97aec3b4285d91f94b04c04dab651b5934de53350d7f2e52')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
