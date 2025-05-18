# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISOcodes
_pkgver=2025.05.18
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Selected ISO Codes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0065ef91837c8da6aaec96d363becf6b')
b2sums=('4efb547286fece74b89587221d27a364ec2e5ec45df8a2c2781a1889f60eff7dd6917dbd5c6329ef154c55dec9120c0b28562396feb83b0a592f153b363622cc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
