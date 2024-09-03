# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=PlotTools
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Add Continuous Legends to Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sp
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dd3e092b54de6ec81cbfbf9ef0e3c7d8')
b2sums=('f12ff204cf8e6dcc688c949f82fb118983fa3a52e2f697b48e1de528518ccf7f200a94d3ecd0bd48c71512f81eda5f7ef43361b27fb8b5e5230b4e6cf057d198')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
