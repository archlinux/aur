# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OSAT
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Optimal Sample Assignment Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biobase
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('10c851ab466d6d994dd5c7b927b4144f')
b2sums=('3ba40e352da82ce290e081d2b873816221cbd8a9c1991a14ef1989c17b5bfcc54094bcb39eb951ae691e23bc91fecbefdebdf3c0335bd1ac0f9d6bc1b169f3e5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
