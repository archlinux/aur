# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HiveR
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="2D and 3D Hive Plots for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-jpeg
  r-plyr
  r-png
  r-rcolorbrewer
  r-rgl
  r-xtable
)
optdepends=(
  r-bipartite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d40928b9eb713ba6a1fe7ea71017714d')
b2sums=('e23c2d7a91b580ab86ee3709792a27bc8c577748052655336e7b0197cea704a660c9a1cc8257f21f893b3ce8cb8af7f8c6c3f2ac238d0c56cbaeba76ae7999d8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
