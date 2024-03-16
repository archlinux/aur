# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MEIGOR
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MEtaheuristics for bIoinformatics Global Optimization"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cnorode
  r-desolve
  r-rsolnp
  r-snowfall
)
optdepends=(
  r-biocstyle
  r-cellnoptr
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dba5520426098746dde91e0e72abcf50')
b2sums=('c4dcb2cf087c8241be759db874c28a989b013712a12bf9d97b0bf5ee428575d7152828c92fa757fad124b852ffcd2d578ac8d81e5d0842bf2468d5a78dfcabf7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
