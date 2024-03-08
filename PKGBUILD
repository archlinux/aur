# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=misc3d
_pkgver=0.9-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=11
pkgdesc="Miscellaneous 3D Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rgl
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('18e9aceebaf3cad5c04ddc837331930d')
b2sums=('b73fb28bdc192678c53cc086cecc5a9a711d841ec870e81f545ee07e08c893f0379f47ad94aed20559de600a305a7d5bb0e5e8d08f126d3d37d2d22c6068526b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
