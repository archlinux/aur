# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bmp
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Read Windows Bitmap (BMP) Images"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-pixmap
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2fcfe09f7ef8d18454a3efb0d9b4263f')
b2sums=('dd7e82a3f642c2641340423378593e98dadc6f6842b58380a855dc58e82f3f8fe0335509de5081c5381bd99179062f3ea2da16ed8b89d1b70a84ad946b2c67f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
