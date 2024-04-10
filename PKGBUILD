# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayhelpers
_pkgver=1.1-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Convenience Functions for Arrays"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-svunit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d94d13f45d5f4c8a771c1c670a5368e6')
b2sums=('7c92e9f149e880d27042d7253f33f2e966b97705c4bf84c4cabe430c087c31ffef58aa1ff1ac999341a641ae8f094ce28fa36e043de6f4b9a862274dab32505b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
