# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yulab.utils
_pkgver=0.1.2
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
md5sums=('c3f7e0861644bc0867d34c2b90f157e6')
b2sums=('c9f078cb94fd88b536c06aeaf4e10b8a58826eccece332fd4b78bab56ae28d68e4b522456a5d4bdb4a606b0b431f584e1f632824e4ef1aa803ca79aedf8cf7ca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
