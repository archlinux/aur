# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=fscache
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="File System Cache"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-chk
  r-lgr
  r-lifecycle
  r-r.utils
  r-r6
  r-stringi
)
optdepends=(
  r-covr
  r-knitr
  r-lintr
  r-rmarkdown
  r-roxygen2
  r-stringr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4ae77fbd143f3d6a755877fbb23aa6ac')
b2sums=('0a6742b3aa30bc7b62f1668616dc7fc12c211d5918af2ffee901731a136a184e03a83bedac489e70a5f5103eb4e518f1b2b7be628419c317c1cb2155e4a15599')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
