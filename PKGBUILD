# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterStab
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compute cluster stability scores for microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-fibroeset
  r-genefilter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f29f89a3b89fd713ff41e7adb8f18af2')
b2sums=('ddd673ba5c4a743c0e9c9209254796d276db5d31526243ad22552ae0a3f64d3b8e7328395eff392db6c59e666a1ecaef02c36925e3f3101cef7417dba5ed9e52')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
