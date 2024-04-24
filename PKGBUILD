# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pixmap
_pkgver=0.4-12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=11
pkgdesc="Bitmap Images / Pixel Maps"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5deaedfa04d24456ab59dbed80445b45')
b2sums=('dc1a00bfc633b1fc08447fe6b3988279e65b1f1f287f2787f8f69f5a4990493ab9b32a2eef84a12b40597cc25709eb6b3f76b4401767a1e9fa8ef8603b30b0c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
