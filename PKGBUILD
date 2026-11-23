# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=missRanger
_pkgver=2.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fast Imputation of Missing Values"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-fnn
  r-ranger
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fe67b4f9df815526278ae5deca05e734')
b2sums=('abdcb449cbd85fcdf20e7869bf5b0fd16b93e10009967a778c3707f828419be14a8e26c7159248c2c890331338f3ac609b5cff3f4d298bfa43dd172a855f378d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
