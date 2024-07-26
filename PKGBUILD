# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yulab.utils
_pkgver=0.1.5
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
  r-memoise
  r-rlang
)
optdepends=(
  r-httr
  r-jsonlite
  r-openssl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f0aa2a68f4c8233d510877a1d59e42a')
b2sums=('09c6134e93bcd8cec4a72e407d28179d0ed316b530497754c1dd9e4e86b0aada8fd90b709d415f36cb81bed8b641fe3fee07e314c85516395f0225de71934d4d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
