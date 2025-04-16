# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sagenhaft
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collection of functions for reading and comparing SAGE libraries"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sparsem
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f9da7d1dd05da3f6a1566c181e0fe0db')
b2sums=('22f41169486b62d9b05f2688f030c445b63a3f965f124d554591df99b764995e295053a84910bbc6051760df8afc643f36d473f964e58e723e4294d4106690b4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
