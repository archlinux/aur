# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOmap
_pkgver=2.5-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Topographic and Geologic Mapping"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-fields
  r-mba
  r-rpmg
  r-sf
)
optdepends=(
  r-geomapdata
  r-maps
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('17ee2aaa63793db1f437c82b97652c44')
b2sums=('86af719493e0cb1248e9af1753c9f8597230d52df5b89e4a91dc8076d96b8bb81bbccd4faef76a219e50e1d337ddcd28cda1e71eecaa6f1b5febbfd6485db525')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
