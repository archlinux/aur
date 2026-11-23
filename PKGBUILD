# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=bigsnpr
_pkgver=1.12.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Analysis of Massive SNP Arrays"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-bigassertr
  r-bigparallelr
  r-bigreadr
  r-bigsparser
  r-bigstatsr
  r-bigutilsr
  r-data.table
  r-dorng
  r-foreach
  r-ggplot2
  r-magrittr
  r-rcpp
  r-runonce
  r-vctrs
)
makedepends=(
  r-rcpparmadillo
  r-rmio
  r-roptim
)
optdepends=(
  r-bindata
  r-covr
  r-dbplyr
  r-dplyr
  r-gaston
  r-glue
  r-hmisc
  r-microbenchmark
  r-pcadapt
  r-quadprog
  r-r.utils
  r-rhpcblasctl
  r-rmutil
  r-rspectra
  r-rsqlite
  r-spelling
  r-testthat
  r-tibble
  r-xgboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f7d54f83d815e35cc080f4f6b1a66fe')
b2sums=('2a58d0d4a494d5d50e7e3e2f9233e761a9abda83c43a129190c521762a7b359310fd7f718b43c23da86ba01460ace4aa5535d74d20f6cb3eb5195e0d507c54c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
