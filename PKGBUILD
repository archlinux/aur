# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss.data
_pkgver=6.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Data for Generalised Additive Models for Location Scale and Shape"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5b64ed3f16e92d61d45b105135ed168f')
b2sums=('5ddf1fbecae44baabbdb289b51b7f9fc24ea573cf6dc7712af0cfebeb50e05c37b4ff24bbd85e4def3a8728f757081d0cfbeff853832754f1b1a4323f8c83998')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
