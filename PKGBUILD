# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yulab.utils
_pkgver=0.2.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Supporting Functions for Packages Maintained by 'YuLab-SMU'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-cli
  r-digest
  r-fs
  r-rappdirs
  r-rlang
)
optdepends=(
  r-httr2
  r-jsonlite
  r-openssl
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a6eb9c0e13d9257dd3e07e2acffa6954')
b2sums=('1865119ba378b4b4f7f56265d784757d529a1f206bc4179ee85437382f849e683259e9c88ca296a521e07d198e73e43a2cbdaa7d9de8bfab023922f4457bc34c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
