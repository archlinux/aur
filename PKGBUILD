# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PFAM.db
_pkgver=3.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A set of protein ID mappings for PFAM"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-dbi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b5fd5c9c43685f2b45a3102b98673d36')
b2sums=('d76c54d672136a0a8a5bf28691abf5c9bb972e208a20f41e1ae964c9a8e2084a90c1c994ef86499185f6819bea0577f5fd95d023e8a15ab52d324e8197bb6886')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
