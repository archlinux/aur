# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=filematrix
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="File-Backed Matrix Class with Convenient Read and Write Access"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rsqlite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cfa4f4793c89ea6d8d4a09792e9ca2fa')
b2sums=('0627479fb06814191afa1c0bb37de3eae3045ecd7270047a87048b9bc6265cb9423d57dbb82a04f58404d991ca2cf67e44372503cd8bb6c2906c4726427b80a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
