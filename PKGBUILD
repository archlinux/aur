# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Bt.eg.db
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Bovine"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7198a14bed07de18efd8669f5ffb6da6')
b2sums=('325c82b6c579e86df7dc593878c0a6ff5999e1a3a1b92b1820eadf0fc85cbc8c03384bed8553d2d93f5564673c39ae45a077fee3f6bfc968318496abd9501747')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
