# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=hierfstat
_pkgver=0.5-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Estimation and Tests of Hierarchical F-Statistics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r-ade4
  r-adegenet
  r-gaston
  r-gtools
)
optdepends=(
  r-ape
  r-knitr
  r-pegas
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('265e9c8cb527b121b24ca20da2ae46b8')
b2sums=('97b423ef614c12322d558baeea6d22356a6a3675b4ea87e7cfce61bd7c3aa5cf8d7d762894b47312532a4fbc99459f1bedac477c2155b0a63c2fe55128fb3c26')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
