# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ddCt
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The ddCt Algorithm for the Analysis of Quantitative Real-Time PCR (qRT-PCR)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biobase
  r-biocgenerics
  r-rcolorbrewer
  r-xtable
)
optdepends=(
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eecb3a34a3df5abc4f1fabf7fef3b1e0')
b2sums=('9cbb393698322593e02af6544cd0537d65aa9f2d43078e27619ac90f6e86c90cbb4788c7e069b9fbd8ae5c8e315c3e0fd93a69123183cec367fc95f2b6a4d4e4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
