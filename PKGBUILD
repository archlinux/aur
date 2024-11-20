# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NLP
_pkgver=0.3-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Natural Language Processing Infrastructure"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e0fd3a610d447328c65fe7664070b063')
b2sums=('c31b656461662ca2177418700c8aaa38e7aac6c27aad3477b44032c0da42b42ddd1afcb06e8960527295d32c87e5b825b85d04abe14374ce3658926631cd1beb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
