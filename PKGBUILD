# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NCmisc
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Miscellaneous Functions for Creating Adaptive Functions and Scripts"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('335afd425302add247fdef690d638144')
b2sums=('10085142f1e1a207416962ba41e00fa21317a67690f536c56ae90578386943aadf44ad5e79401fffc0caa96ef7f76ca1922bbc198367fbc10450b87c059dc280')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
