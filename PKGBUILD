# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=bigreadr
_pkgver=0.2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Read Large Text Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bigassertr
  r-data.table
  r-parallelly
  r-rcpp
)
optdepends=(
  r-covr
  r-rsqlite
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b1b65b9aebeda3ec4eb26eec37c3be8')
b2sums=('89e771e716d54405e3186108eb8e043abfc430ac005133e762348572c17ea0538dca6e95023f4c98006b0079ef857797aa80c75f5399ef3acd4a31cb88d47e9f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
