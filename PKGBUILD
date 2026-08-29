# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yulab.utils
_pkgver=0.2.5
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
  r-r.utils
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09c42a5753acb5f2b98badebf5dc3ec6')
b2sums=('340bb163addc87bcd3cb2472f891e8ea052d8a4dc227285ef6bf6f7d8237bd685c002a2ae3e5b7bf978a17e69dc3436459f461088644a7ebdc475e4595449043')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
