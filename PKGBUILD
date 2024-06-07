# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cba
_pkgver=0.2-24
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering for Business Analytics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-proxy
)
optdepends=(
  r-colorspace
  r-gclus
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6e5861366f7c567c64ed74e276ca482e')
b2sums=('416f54e6060ada9f95346080275c5d3840a6758abc7bd84a814772de1139523392a373fbe29bc54222ca0551b86e3a204ece3f636375253e9bd8d19deefecffd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
