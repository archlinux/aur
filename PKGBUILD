# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ORIClust
_pkgver=1.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Order-Restricted Information Criterion-Based Clustering Algorithm"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('45f234da67bcf367370cf7b471511f19')
b2sums=('605a04fe14edd4102a35c1cc833fcab019d6b1c6959848ffc40702bc4c43354b9e910f1b64496c3106cc13318428eccc5e31b09ce9d07ab927435d489743d73b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
