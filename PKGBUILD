# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DynDoc
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dynamic document tools"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('94aa5bbda36d5fff152b3c1a3df4878c')
b2sums=('6fcdb5cf5a2e465d7360d9378c19956f1abd56b525133ace366a0810335a1aec1a0ef6dca76b2d8348bd61687c851f8c0b9fdb00c4181cd545d818158487b9b8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
