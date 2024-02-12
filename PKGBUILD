# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Clonality
_pkgver=1.47.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Clonality testing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dnacopy
)
optdepends=(
  r-gdata
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ed37ef997cb1af4c83a20890e526281')
b2sums=('697c298e62145768f9b165ef34601102ef6e3c9d03d898135acd8bedac8de15cb66c0ac94bfb4026865ae172878c6974c4e567feb41075ce72797264f8e3a743')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
