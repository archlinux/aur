# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BAGS
_pkgver=2.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A Bayesian Approach for Geneset Selection"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-breastcancervdx
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('42c7a57422ddbb5c2d5263703a7e22d0')
b2sums=('21b3fd710bd8be7b589b3aca2ce0364f771670565bcac7922cbab0d61878453fa1562a7e26adb77475eba6acac9cbcd693b62401e95d03e57fd3047d4b94afa6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
