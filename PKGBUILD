# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isa2
_pkgver=0.3.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="The Iterative Signature Algorithm"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC-BY-NC-SA-4.0')
depends=(
  r
)
optdepends=(
  r-biclust
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('01ce8d5c7bd43fa7fe702cbdaf6863d3')
b2sums=('d0d587629d79353c47bfeded7557d6d673eeee1993b6de2f29f1b7546b7a1b3aab1e251d192e8d7fb7165d70d8cf948a0f8d157810b0fc677eb8669ee5dc4c1d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
