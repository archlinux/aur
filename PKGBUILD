# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proftools
_pkgver=0.99-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Profile Output Processing Tools for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-graph
  r-knitr
  r-rgraphviz
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d37a9164123380f5ad571d73216ff967')
b2sums=('6092bdfa613c2e0caa858079f2364f40f5a539a9f495f65c3fafc0a92d90259a10755b81e9763822c44d9f4604a182e3564350fb45d943bfba4d880a63272c8a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
