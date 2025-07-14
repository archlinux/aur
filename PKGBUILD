# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mefa
_pkgver=3.2-10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multivariate Data Handling in Ecology and Biogeography"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-mefa4
  r-vegan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('92f5dc3827db715b28e3babb7a682a52')
b2sums=('07b5f590d1230f8a058f67545ee49b064219fa1205258a529c01d82f2ffd9b3bb54d198c4adf225a03f8e39c28b8dc27d75cb3ecdd805d752af090b7f98ce130')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
