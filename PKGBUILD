# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proftools
_pkgver=0.99-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('6be0cdeb89878066a387b6c4141034e4')
b2sums=('1b289e2562b7b72beadfe48a606ddc77c5f6639616064ef782c65f900a2a8ed6a94d9122ed5e9babfc071575d36fd7cca210d0516ad7a1e614cb0aca23d1f07f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
