# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bladderbatch
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bladder gene expression data illustrating batch effects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('711dc856bebd0e6e0033f63bf4198aa5')
b2sums=('a6722d2e308098d9783a9f1bea978f520313981fc02a5c938b132a0d5e7848f672abcd6501100f128f1aca377327b6fbf3f2344f48aaef0e01fa7bbbcf3400ba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
