# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aroma.apd
_pkgver=0.7.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Probe-Level Data File Format Used by 'aroma.affymetrix' [deprecated]"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r-r.huge
  r-r.methodss3
  r-r.oo
  r-r.utils
)
optdepends=(
  r-affxparser
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('061509af986948e82ecabafdd3fd2d7a')
b2sums=('e9661ba0dd81c50746a5fd22a28017d8e62d6ef162acce197a40b9c863767a8ceb41ce5f8f023d16f549c018c2e0f358c0d07cc8e13cdd4e84dc006a6d147f8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
