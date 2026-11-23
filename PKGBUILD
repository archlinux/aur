# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svMisc
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Miscellaneous Functions for 'SciViews::R'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-cli
  r-rlang
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e35aef4cb07d2dea8a51fc92fda3fbde')
b2sums=('1d972aafa723b873c6dfa5715db6ac6a4798b906459b0c59e2b975f61c8340767ecd278448528412f1ab464fa7c65d90b475b90713d068d6271ce0ac460e7286')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
