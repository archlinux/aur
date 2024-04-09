# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ORCME
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Order Restricted Clustering for Microarray Experiments"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-iso
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('735283f8bee62bf430180975b1a7616f')
b2sums=('7a2d61470179f5f5d00e47e91f98237b036240ff68a8ee4dedca5fca794510f5a710f91b055e9271e64626ec9a988f26c70266cd8d34ab57a5fd7c9a9505d958')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
