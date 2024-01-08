# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yulab.utils
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Supporting Functions for Packages Maintained by 'YuLab-SMU'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(Artistic2.0)
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
md5sums=('fb9d6f7ebd8b23ce051a78ab86c2c9fd')
b2sums=('e27a3db3bb300390c278bbc843c3b57e172e7ab1d1e0ac501c078b209f4ddea8bdd977fc212260fd531d568761de2176626f616e6df1b2a3164eab293be17756')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
