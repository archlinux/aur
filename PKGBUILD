# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=quitefastmst
_pkgver=0.9.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Euclidean and Mutual Reachability Minimum Spanning Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6544d9e0daa88613f886421425b3d8c6')
b2sums=('08c7cff164dd754bd79c7e55e627b7e888cd480b5d0f9620e4718c071cddf1b8bd6d1f92c941f9fe2612fb131f78aca454f53e3ec5a70a748c7ca9e0ee123227')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
