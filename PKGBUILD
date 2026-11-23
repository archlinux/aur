# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=DFBA
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Distribution-Free Bayesian Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-bookdown
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('95271b65193650d50ea27705f59da6b6')
b2sums=('0b20396a52dab00f6e4ab5b0a225178862d8c0ea117f6fdcd285cbb29626e34e5888f6ace8a53948ade71f1af9b80ae66812c43b34bcd0c03d8c2916722e85cf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
