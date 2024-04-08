# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=snowfall
_pkgver=1.84-6.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Easier Cluster Computing (Based on 'snow')"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-snow
)
optdepends=(
  r-rmpi
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4ca758a26dd4e862cc9ffd43ae16b2d3')
b2sums=('f641aeef1a201c75424f61db662bf523fc277ac4d4abfb113588f52757c5b93c77af17bf97282dbd85604ff7099e9b62f6f80b7a672064447a9dc5512850e61e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
