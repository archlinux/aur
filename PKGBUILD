# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=liger
_pkgver=2.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Lightweight Iterative Geneset Enrichment"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-matrixstats
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d7a410589d361d183968613aeed4fd2a')
b2sums=('6e428732dcd28f84dd24dcbbb591849424fa5e8ea9c4286fe6d8fe72a3649843f5ea7f35fafcecfb9f2735cc50da4eec15c723c0906a9732bbb41d7fce21788c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
