# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dtangle
_pkgver=2.0.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cell Type Deconvolution from Gene Expressions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-deoptimr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fa2e9fe4c5976c5e28f08e5c50c5a901')
b2sums=('5595d123bef38673ac9b71199bc69f5af7913293aff3ac31b5b19272a4b888c4e91e0463aedf07e0c6a57cc89fc0ae667e6b4fb2eb6a77821f8974ecbad3ea50')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
