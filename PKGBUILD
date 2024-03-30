# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metahdep
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Hierarchical Dependence in Meta-Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-affyplm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('578b66621982372185989aa8559f8293')
b2sums=('6b64aefd4274e259c52a27577899fc3579da9034767ea54e3b508028beb756d1a0fb580916483dbcecb5682a6116107b9fc5f823128860b66e99207b44687f99')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
