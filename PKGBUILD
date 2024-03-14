# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterRepro
_pkgver=0.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Reproducibility of Gene Expression Clusters"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('23577a5fc8b7520382a9cfe001185df5')
b2sums=('5d6a03ec143b8eb09ccf6c7d9c031d96a8270b89d1b1f0099326982989c73adf79870c47d34a8d9f49b8646e95ce14501688ba912f39e5f0de71602896483688')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
