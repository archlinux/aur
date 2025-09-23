# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reportr
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A General Message and Error Reporting System"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-ore
)
optdepends=(
  r-tinytest
  r-covr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8b999894dee4e12ba6002b9248b2408')
b2sums=('fcd7704f1b866c00fc78b6c0cccd1ee33727dc42379828e81234fb77186c0e141a2c02bf342678ee7ca35fefc8cbdb5293c4f0d5ad47281790eac6ca8a2a84e2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
