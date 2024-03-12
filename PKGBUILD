# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MALDIquant
_pkgver=1.22.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Quantitative Analysis of Mass Spectrometry Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('389460254c436902b8d8d0980dc805b6')
b2sums=('d9648cbbad317da563a6020cd356849814d483274b45e70cfc6cc37abc0b9f628d144a72c2315172ad50029cf6f57ee40887d5d340eb1defdea13a54b3bd1dd3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
