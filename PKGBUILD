# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svMisc
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="'SciViews' - Miscellaneous Functions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-covr
  r-knitr
  r-markdown
  r-rjava
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b94227b8913984ed493eefca71c45975')
b2sums=('4d43655c69ae092b5de164ccaf6cdc816de2534f6d61eb845d4f762d6bedf0b2bb57b5247d56e86d312a410c12034e74aab58ae215db04ef1574c2e5b40bf60e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
