# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randPack
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Randomization routines for Clinical Trials"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cd593cb5f620decf7ccc99ed22b17ba6')
b2sums=('b94d25abddaa6caa8e9a8281065aa71a8aaff9141d744146b01eabdb9d552c30a01a0680c7a8686efe6bbc027a1b40077b63a1599b1e4826998d4b7dd2958a7c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
