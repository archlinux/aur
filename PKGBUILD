# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.matrices
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Assertions to Check Properties of Matrices"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-assertive.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5602be5710fd1f9faae8ca638b490d4c')
b2sums=('a5b066662c6f08447c51b82e4f941e58836a5140eccf9a48a4c20309654ea76ee0195ea5099f0c0b75cb5dcacd5b709ec9e98acee5f99a545997fa2132c6e930')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
