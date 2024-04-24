# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dynamicTreeCut
_pkgver=1.63-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Methods for Detection of Clusters in Hierarchical Clustering Dendrograms"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('51be13b9a5c07558b89d3ec6f9fc5363')
b2sums=('4b4947f7149a78497d647935f89aa7adb84082af63742b78e3679d4e46551790a92fc98cf93152b9727aa47646ec718ae8a48afbb9f51ab8ddae6a624c23b2f0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
