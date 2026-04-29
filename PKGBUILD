# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISoLDE
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative Statistics of alleLe Dependent Expression"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ab1ba1d3299590d60ec7fe6cf4a9a26')
b2sums=('26aba10e0a98a3aad59e3fd764193ad5101676e6f8cfc35da0d47690fe61557800d4b02c8a734edf6faccf35420736445bcbb325518bf37653e084b23b99f8e5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
