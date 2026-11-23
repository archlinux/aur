# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=sqlq
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="'SQL' Query Builder"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-chk
  r-dbi
  r-r6
)
optdepends=(
  r-covr
  r-cyclocomp
  r-knitr
  r-lgr
  r-lintr
  r-rmarkdown
  r-roxygen2
  r-rsqlite
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5a28ceba26d460edbc97398e91984bcd')
b2sums=('e7a52af4e717faa135d71bbf469baccd11fd03be19c89eb5f8cf7de5172c4f0d13c419a5d2415675406d0de21f3e36e485a048a2a7efdf102a7df598a2df4312')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
